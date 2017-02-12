# Project 1 - *Flicks*

**Flicks** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: 
Week 1: ~7 hours
Week 2: ~15 hours
**23** hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.
- [X] User can view movie details by tapping on a cell.
- [X] User can select from a tab bar for either Now Playing or Top Rated movies.
- [X] Customize the selection effect of the cell.

The following **optional** features are implemented:

- [X] User sees an error message when there's a networking error.
- [X] Movies are displayed using a CollectionView instead of a TableView.
- [X] User can search for a movie.
- [ ] All images fade in as they are loading.
- [X] Customize the UI.

The following **additional** features are implemented:
- [X] Customized Navigation Bar (Color, text color, title is same as tab bar)
- [X] Customized Status Bar (To white)
- [X] Customized Search Bar Color (Cancel, typed text)
- [X] Customized Tab Bar (Image, selected color)
- [X] Customized selected cell color (Highlighted as yellow)
- [X] Customized launch screen (imported custom font)
- [X] Implemented the cell deselect
- [X] Added ratings to the movie descriptions
- [X] Color coded ratings
- [X] Added scroll view to the movie cell description
- [X] Edited scroll view in DetailsViewController so background photo is not moved
- [X] Added year of movie release to the movie title in DetailsViewController
- [X] Search bar filters by movie titles beginning with the search input (not simply contains)
- [X] Cell descriptions are also fitToSize()

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to better implement the search function (i.e. searching by genre or ratings)
2. How to implement a filter (audience age ratings, genre, showing on a certain day/time)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/I2ol9T7.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Week 1:
- Had difficulties implementing the collection view. 
- Also attempted (but failed) to implement the search bar.
- movie-browser is the old tableView version
- Flicks is the collectionView version

Week 2:
- Had difficulties changing the color of the entire cell as it is selected
- Was unable to use imported font in launch screen (cannot be loaded at launch). Substituted with an image instead

## License

    Copyright [2017] [Vicky Cheng Tang]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
