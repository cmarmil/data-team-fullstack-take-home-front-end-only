import React from 'react';
import productImage from '../assets/wines/folk-and-fable.png';
import styles from './App.scss';

const App = () => (
    <div className={styles.container}>
        <h1>Folk and Fable 2016 Red Blend</h1>
        <img
            alt="product"
            src={productImage}
        />
    </div>
);

export default App;
