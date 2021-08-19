import React, { useState, useEffect } from 'react';
import Divider from '@material-ui/core/Divider';
import GameCell from './GameCell';

function GameList() {
  const [games, setGames] = useState<any>([]);
  const assertedWindow = window as any;

  useEffect(() => {
    fetch('https://kismet-bd1ac.firebaseio.com/assignment/games.json')
      .then((res) => res.json())
      .then((result) => {
        const mappedGames = result.map((item: any, index: number) => ({ id: index, ...item }));
        setGames(mappedGames);
        if (assertedWindow.webkit
          && assertedWindow.webkit.messageHandlers
          && assertedWindow.webkit.messageHandlers.gameListMessageHandler
        ) {
          assertedWindow.webkit.messageHandlers.gameListMessageHandler.postMessage({
            games: mappedGames,
          });
        }
      });
  }, []);
  return (
    <>
      {games.map((game: any, i: number) => (
        <React.Fragment key={game.id}>
          <GameCell game={game} />
          {i < game.length - 1 && <Divider />}
        </React.Fragment>
      ))}
    </>
  );
}
export default GameList;
