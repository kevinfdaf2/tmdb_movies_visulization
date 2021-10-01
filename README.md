# tmdb_movies_visulization

Dataset from https://www.kaggle.com/tmdb/tmdb-movie-metadata.


This project aims to analyse the investment, popularity, score and some other attributes of nearly 5,000 films. By dividing the release date of nearly 5,000 films into decades, count the number and proportion of films at each period, to analyse the development, history and prospect of the film industry. Besides, it also provides the ranking of movies according to different attributes of each period and provides various information, such as Budget, Original Language, Production Companies, ProductionsProduction Country and Release Date, etc., of the best movies for users. Also through the linear regression of the film's budget and other attributes to understand the relationship between the film's expenditure and return. 


## Packages

- d3.js(v4) & colour scale 
- python JSON package
- jQuery


## Font

- Montserrat
- Pacifico
- Nunito
- Fjalla+One
from http://fonts.googleapis.com


## User guide
### Title bar
- Click the icon and text in the left can refresh the page.
- Click the title in the middle will jump to the official site of 'The Movie Data Base'.

### The doughnut chart
- When the mouse over the doughnut diagram, a Tooltip will display the number and proportion of films produced during the period. 
- The right side of the doughnut diagram shows the best movie posters and details for that period.
- By clicking on the different stages, the poster and detail on the right will change accordingly.
- If you are interested in the film, click the title, it will bring you to the homepage of the movie.


### The bar chart (rank)
- Users can select a year period to show the rank of genres by a drop-down list.
- After select a year period, the right bar chart will set to default population rank.
- By first select a year period, then choose an attribute to sort the movie by using the select button on the right, user can get the movie rank in each period with multiple attributes.
- When mouse over the bar in the genre rank a tooltip will shows the number of film in this genre.
- When mouse over the bar in the movie rank a tooltip will show the detailed information of the film.


### The scatter plot
- When the mouse is over the circle, the title of the film will show up.
- When clicking the circle, the right side detail box will show the detail of the movie.
- The drop-down button on the middle-top can change the attribute in Y-axis.
- Click the movie title in the detail box can jump to the homepage of the film, if there is no homepage, it will jump to a 404 page.


### No home page site

- If the movie doesn’t have a homepage or the data of homepage is lost, the link will guide to this page, click Back to the previous page can go back to the main page of the project.




## References
- Jack (2016), Determines whether a string is a valid JSON format, form https://	blog.csdn.net/elecjack/article/details/51901054
- Dataset form https://www.kaggle.com/tmdb/tmdb-movie-metadata?select=tmdb_5000_movies.csv
- Font Montserrat, Pacifico, Nunito, Fjalla+One from http://fonts.googleapis.com
- Zhu, N. Q. (2013). Data visualization with D3. js cookbook. Packt Publishing Ltd.
- Heydt, M. (2015). D3. js by example. Packt Publishing Ltd.
- nohomepage.html is modified from https://codepen.io/AsyrafHussin/pen/KxWRrK














