import React from 'react';
import ReactDOM from 'react-dom';
import { createMuiTheme, ThemeProvider } from '@material-ui/core/styles';
import App from './components/App';
import './index.scss';
import { EDEN } from './constants/colors';

const theme = createMuiTheme({
    palette: {
        primary: {
            main: EDEN,
        },
    },
});


const renderApp = () => {
    ReactDOM.render(
        <ThemeProvider theme={theme}>
            <App />
        </ThemeProvider>,
        document.getElementById('app')
    );
};

if (process.env.NODE_ENV !== 'production' && module.hot) {
    module.hot.accept('./components/App', renderApp);
}

renderApp();
