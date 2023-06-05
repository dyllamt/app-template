def test_home(client):
    response = client.get("/")
    assert response.json() == "Hello, World!"
