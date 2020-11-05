import React from 'react';
import WineSelect from './WineSelect';
import WineDetailsCard from './WineDetailsCard';
import Ratings from './Ratings';
import NewReview from './NewReview';
import PleaseSelectMessage from './PleaseSelectMessage';
import styles from './App.scss';

const App = () => {
    const [wineName, setWineName] = React.useState('None');

    const [wineId, setWineId] = React.useState('0');

    function setCurrentWine(event) {
        setWineName(event.target.value);
        setWineId(event.nativeEvent.target.getAttribute('data-id'));
    }

    return (
        <div className={styles.container}>
            <WineSelect
                selectWine={(event) => setCurrentWine(event)}
                currentWine={wineName}
            />
            <div className={styles.resultsContainer}>
                {wineName !== 'None'
                    ? (
                        <>
                            <WineDetailsCard wineId={wineId} />
                            <Ratings wineId={wineId} />
                            <NewReview wineId={wineId} />
                        </>
                    )
                    : <PleaseSelectMessage />}
            </div>
        </div>
    );
};

export default App;
