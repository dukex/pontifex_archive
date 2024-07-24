import os
from PIL import Image

def convert_webp_to_png(input_path, output_path):
    try:
        with Image.open(input_path) as img:
            img.save(output_path, 'PNG', quality=100, optimize=True)
        print(f"Imagem convertida com sucesso: {output_path}")
    except Exception as e:
        print(f"Erro ao converter a imagem: {e}")

def process_images(directory):
    if not os.path.exists(directory):
        print(f"O diretório {directory} não existe.")
        return

    for filename in os.listdir(directory):
        if filename.lower().endswith('.webp'):
            input_path = os.path.join(directory, filename)
            output_path = os.path.splitext(input_path)[0] + '.png'

            convert_webp_to_png(input_path, output_path)

            try:
                os.remove(input_path)
            except:
                print("")

if __name__ == "__main__":
    process_images("/home/duke/Downloads")
