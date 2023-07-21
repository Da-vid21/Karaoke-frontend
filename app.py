from time import sleep
from flask import Flask, request, jsonify, render_template, send_file, make_response


app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

# This one is to process youtube Links
@app.route('/YTLink', methods=['POST'])
def processYT():
    sleep(50)
    # print(request.form.get('youtube-link'))
    link = request.form.get('youtube-link')
    
    return link
    links = main.main(link)
    video_link = links[0]
    instrumental_path = links[1]
    vocal_path = links[2]
    
    # Render the template
    return render_template("karaoke.html", video_path=video_link, instrumental_path=instrumental_path, vocals_path=vocal_path)
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
