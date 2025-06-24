from flask import Flask
from .models import db
from .config import Config

def create_app():
    app = Flask(__name__, template_folder="../templates", static_folder="../static")
    app.config.from_object(Config)
    db.init_app(app)
    with app.app_context():
        db.create_all()
    from .routes import bp
    app.register_blueprint(bp)
    return app
