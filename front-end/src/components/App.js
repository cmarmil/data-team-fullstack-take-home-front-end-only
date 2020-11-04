import React from 'react';
import productImage from '../assets/wines/folk-and-fable.png';
import WineSelect from './WineSelect';
import styles from './App.scss';

const App = () => {
    const [state, setState] = React.useState({
        selectedWine: 'None',
    });

    return (
        <div className={styles.container}>
            <WineSelect
                selectWine={(event) => setState({ selectedWine: event.target.value })}
                currentWine={state.selectedWine}
            />
            <h1>Folk and Fable 2016 Red Blend</h1>
            <img
                alt="product"
                src={productImage}
            />
        </div>
    );
};

export default App;
