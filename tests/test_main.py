
from fastapi.testclient import TestClient
from app.main import app

class TestMain:
    def setup_method(self):
        self.client = TestClient(app)

    def test_root(self):
        response = self.client.get("/")
        assert response.status_code == 200
        assert response.json() == {"message": "Hello World"}