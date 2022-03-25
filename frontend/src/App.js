// Importing modules
import React, { useState, useEffect } from "react";
import "./App.css";

function App() {
	// usestate for setting a javascript
	// object for storing and using data
	const [data, setdata] = useState({
		SONG_ARTIST: "",
		SONG_ID: 0,
		SONG_NAME: "",
		SONG_GENRE: "",
	});

	// Using useEffect for single rendering
	useEffect(() => {
		// Using fetch to fetch the api from
		// flask server it will be redirected to proxy
		fetch("/playlist").then((res) =>
			res.json().then((data) => {
				// Setting a data from api
				setdata({
					name: data.SONG_NAME,
					id: data.SONG_ID,
					genre: data.GENRE,
					artist: data.SONG_ARTIST,
				});
			})
		);
	}, []);

	return (
		<div className="App">
			<header className="App-header">
				<h1>React and flask</h1>
				{/* Calling a data from setdata for showing */}
				<p>{data.name}</p>
				<p>{data.id}</p>
				<p>{data.genre}</p>
				<p>{data.artist}</p>

			</header>
		</div>
	);
}

export default App;

