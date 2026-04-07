import click
import os
import sys
from ai_handler import AIHandler
from pdf_generator import PDFGenerator
from input_handler import InputHandler
from spinner import Spinner
from dotenv import load_dotenv

load_dotenv()


def create_output_structure(base_dir: str) -> dict:
    """
    Create organized output folder structure.
    
    Returns:
        dict: Paths to markdown, PDF, and readme files
    """
    os.makedirs(base_dir, exist_ok=True)
    return base_dir


def run_cli():
    """Convert raw notes into professional structured writeups via CLI."""
    try:
        # Get all user inputs with validation
        inputs = InputHandler.get_all_inputs()

        # Extract inputs
        title = inputs["title"]
        author = inputs["author"]
        platform = inputs["platform"]
        difficulty = inputs["difficulty"]
        raw_notes = inputs["raw_notes"]
        
        # Create sanitized folder name
        folder_name = title.replace(' ', '_').replace('/', '-')

        # Generate writeup with spinner
        spinner = Spinner("AI is analyzing and generating the writeup", style='line')
        spinner.start()

        try:
            ai = AIHandler()
            formatted_content, writeup_type, type_description = ai.generate_writeup(
                title, author, platform, difficulty, raw_notes
            )

            spinner.stop(final_char='[+]')
            
            # Display detected type
            click.echo(click.style(f"\n[*] Detected Writeup Type: {type_description}", fg='cyan', bold=True))

            # Create organized output structure
            output_base = f"output/{folder_name}"
            output_path = create_output_structure(output_base)

            # Save markdown file
            md_filename = f"{output_path}/writeup.md"
            with open(md_filename, "w", encoding="utf-8") as f:
                f.write(formatted_content)

            # Generate GitHub README
            readme_content = ai.generate_github_readme(
                title, writeup_type, author, 
                description=f"Writeup of type: {type_description} at difficulty level {difficulty}"
            )
            
            readme_filename = f"{output_path}/README.md"
            with open(readme_filename, "w", encoding="utf-8") as f:
                f.write(readme_content)

            # Generate PDF
            pdf_filename = f"{output_path}/writeup.pdf"
            pdf_gen = PDFGenerator(pdf_filename)
            pdf_gen.generate(formatted_content)

            # Success message
            click.echo(click.style("\n" + "=" * 60, fg='green', bold=True))
            click.echo(click.style("[+] Writeup Generated Successfully!", fg='green', bold=True))
            click.echo(click.style("=" * 60 + "\n", fg='green', bold=True))

            click.echo(click.style(f"[*] Project Folder : {os.path.abspath(output_path)}", fg='blue'))
            click.echo(f"    ├── README.md        (GitHub ready)")
            click.echo(f"    ├── writeup.md       (Structured document)")
            click.echo(f"    └── writeup.pdf      (PDF format)")
            click.echo()
            click.echo(click.style("[*] Ready to push to GitHub! 📦", fg='green'))
            click.echo()

        except Exception as e:
            spinner.stop(final_char='[-]')
            click.echo(click.style(f"\n[-] Error: {str(e)}", fg='red', bold=True))
            sys.exit(1)

    except KeyboardInterrupt:
        click.echo(click.style("\n\n[!] Cancelled by user", fg='yellow'))
        sys.exit(0)
    except Exception as e:
        click.echo(click.style(f"\n[-] Unexpected error: {str(e)}", fg='red'))
        sys.exit(1)


if __name__ == '__main__':
    run_cli()

