# Course Scrapper

This is the capstone project for the end of the ruby course in microverse.
This is a bot which reads the home page of https://www.udemy.com/ and gets the most viewed courses and then presents them to the user. 

You can se a demonstration of the scrapper in [this video](https://youtu.be/Pt3eEv4CidE)

## Built With

- Ruby

### Gems
- Colorize
- Nokogiri
- Watir

## Instructions
The project was created to be able to import the libraries to any other project and run it there. A test file called udemy_scrapper was created to show the capabilities of the reader.

To use the test program, follow these instructions:
- Make sure you have ChromeDriver installed in your machine, this allows the program to open a window and search for the information you want from the website. To do that, run the following command on your terminal:
- ```sudo apt-get install chromium-chromedriver```
- Download the contents of the repository
- Open the terminal, make sure to change directory to the bin folder in the project
- Run the program by typing udemy_scrapper in the terminal

If you want to use the classes in your own program, you can copy the scrap_reader.rb and course_class.rb in your own libraries and reference them yourself. If you want to use them, these are the methods included:

- ```initialize(page)```: This initializes the PageReader class. The page has to be 'https://www.udemy.com/' for the moment. This was created like this as later the class could be upgraded to read other sites.
- ```search_all_courses```: Returns an array of all the courses shown in the home page. The array elements are of type Course, which is a prorietary class for this project.
- ```create_courses_array(slides_html)```: Receives the html of the carrousel slides and compiles their information in an array of courses.
- ```search_by_name(key)```: Uses the key to search for courses by name. This calls the search_all_courses method to get an array of courses, then searches for courses in it and filters them.
- ```search_by_price(min, max)```: Uses a minimum and maximum value to search for courses in that price range. This calls the search_all_courses method to get an array of courses, then searches for courses in it and filters them.
- ```search_by_all_parameters(name, min, max)```: Uses a string key to search by name and also a minimum and maximum price value to search for courses. This calls the search_all_courses method to get an array of courses, then searches for courses in it and filters them.


## Author

👤 **Miguel Dubois**

- Github: [@MiguelDP4](https://github.com/MiguelDP4)
- Twitter: [@Mike_DP4](https://twitter.com/Mike_DP4)
- Linkedin: [Miguel Dubois](https://www.linkedin.com/in/miguel-angel-dubois/)


## 🤝 Contributing

This project is for learning purposes only, I wont accept contributions, though suggestions are welcome.

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- I'm very thankful with microverse as this is a dream opportunity for me.