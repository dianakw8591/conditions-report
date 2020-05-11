# README

# Snow Report

Snow Report is a posting site for associating mountain photos with the local snowpack at the time of the post. Search functionality allows a user to search a specific area for posts with a snowpack within a certain range. For example, a user could find posts (and pictures) from the Stevens Pass area when the snowpack was around 100".

A user can browse locations, see posts, and search for posts without having an account or logging in. Only logged in users can add posts and manage their posts.

## Configuration

Snow Report is a Rails app built using Rails 6.0.2.1.

Download or clone the repository, then run 'bundle install' to install required gems.
```
bundle install
```
Run 'rails db:migrate' in the root directory to create the database locally.
```
rails db:migrate
```
Run 'rails db:seed` to seed the database with location and snowpack data.
```
rails db:seed
```
Run 'rails s' to start a local server.
```
rails s
```
Navigate to `http://localhost:3000/` to explore the site.

## Contributing

Contributions are welcome. Feel free to open a pull request or branch from this project.

## Credits

SNOTEL station data was easily accessible thanks to Powder Lines API: http://powderlin.es/api.html

Regions are based on the Northwest Avalanche Center's regions used for avalanche forecasting: https://www.nwac.us/weatherdata/map/#

## License

[MIT](https://choosealicense.com/licenses/mit/)



