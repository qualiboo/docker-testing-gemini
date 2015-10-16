# Gemini testing with Docker

This image provides a way to run Gemini easily with Docker. 

## Usage

Initialize environment:
    
    docker pull qualiboo/testing-gemini    
    mkdir -p ./gemini/suite
    
    
Create your `.gemini.yml` file in `./gemini`, and place your tests in `./gemini/suite`.

Capture the main screenshots:

    docker run -v $(pwd)/gemini:/var/work qualiboo/testing-gemini capture

Then run your tests:

    docker run -v $(pwd)/gemini:/var/work qualiboo/testing-gemini test

## More

You can easily run your tests with Selenium Grid :

Create a `docker-compose.yml` file:

    gemini:
        image: qualiboo/testing-gemini
    links:
        - firefox
        - chrome
    volumes:
        ./gemini:/var/work
    hub:
      image: qualiboo/testing-hub
      ports:
        - 4444:4444
    firefox:
      image: qualiboo/testing-node-firefox
      ports:
        - 5900
      links:
        - hub
    chrome:
      image: qualiboo/testing-node-chrome
      ports:
        - 5900
      links:
        - hub
        
Then run your tests:

    docker-compose run gemini test

You can also increase the number of available browsers. For example, if you want to have 5 firefox:

    docker-compose scale firefox=5

## Author

Jean-François Lépine <www.qualiboo.com>

## License

See the LICENSE file.