# Front End Coding Exercise

## Requirements
- [node and npm](https://nodejs.org/en/)
- [yarn](https://yarnpkg.com/lang/en/)

## Instructions
We would like you to build a React app that contains a product selector and a product detail page. This needs to be
fully responsive and the app should match the attached screenshots as close as possible.

To help you get started, we have put together a repository with a simple React app, screenshots, and assets.

The repository contains:
- `src/index.js`: app configuration
- `src/index.scss`: app styling
- `src/components/App.js`: starting point of content
- `src/components/App.scss`: starting point of content styling
- `src/constants/colors.js`: colors used within app
- `src/assets/wines/folk-and-fable.png`: png of wine bottle used in detail page
- `screenshots/desktop/`: png screenshots for desktop views
- `screenshots/mobile/`: png screenshots for mobile views

## Get Started
- Run React app
  - Open a termninal
  - Go to the project directory and run `yarn` to install dependencies
  - Run app using `yarn start`
  - Open `http://localhost:8080/` within your browser to view the app
    - the app has been configured to hot reload on change
    - the app is to configured to not hot reload if there are any linting errors within js/scss files, you can see these
    errors in the terminal or in the browser console
- Build the wine selection page and wine detail page to match the screenshots as close as possible

## Acceptance Criteria
1. Material design concepts should be used (Material UI has already been installed)
1. Theme must be set to use `eden` as the primary color
1. An app bar on top where a select is center aligned
1. The select will be loaded with a list of wines with each wine name as an option
1. Upon selecting a wine, the details of this wine should be loaded and displayed
1. Each card within the details page should take up an equal fraction of the page on desktop
1. Each card within the details page should be stacked on each other on mobile
1. The wine image within the details card should maintain a 16:9 ratio but show the entire image
1. The new review form should only allow a rating of 1 - 5 (inclusive) and a non-empty review
1. The button for submitting a new review should be disabled until form requirements are met
1. Upon submission the new wine details should be loaded, which will include the new reviews
1. Finished project should look close to screenshots provided in `screenshots/`
1. Mobile breakpoint should be `768px`

## Notes
1. `1rem = 16px`
1. Testing is not required but would be nice to include :)
1. env vars can be used as `process.env.<var name>` (see used env vars within `.env.development`)
1. The wine image is located within `src/assets/wines/folk-and-fable.png`, use this for all wines
1. Colors used within this can be found within `src/constants/colors.js`
1. The code below is needed to color the select appropriately, please apply it in the correct place
```
    overrides: {
        MuiSelect: {
            select: {
                color: colors.WHITE,
            },
            icon: {
                color: colors.WHITE,
            },
        },
        MuiInput: {
            underline: {
                '&:before': {
                    borderBottomColor: colors.WHITE,
                },
                '&:after': {
                    borderBottomColor: colors.WHITE,
                },
            },
        },
    },
```

## Data Routes
```
# wine list (GET)
http://localhost:3000/wines/

# wine details (GET)
http://localhost:3000/wines/<wine id>/

# wine ratings (GET)
http://localhost:3000/wines/<wine id>/ratings/

# wine ratings (POST)
http://localhost:3000/wines/<wine id>/ratings/
{
    "rating": number (1-5, inclusive),
    "review": string
}

# wine taste tags (GET)
http://localhost:3000/wines/<wine id>/taste_tags/
```

## What to Submit
We would like to see your incremental work along with the finished webpage, so please send us either a ZIP of your
version-controlled directory or a link to your hosted repository.

## Helpful links
- [React](https://reactjs.org/)
- [Material UI](https://material-ui.com/)
- [Webpack](https://webpack.js.org/)
- [babel](https://babeljs.io/)
- [eslint](https://eslint.org/)
- [jest](https://jestjs.io/)
- [Tesing Libary](https://testing-library.com/)
