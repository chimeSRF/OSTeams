import dotenv from "dotenv";

// load config-file
dotenv.config({ path: `.env${process.env.NODE_ENV ? `-${process.env.NODE_ENV}` : ""}` });

// load app with current config
const { app } = await import("./app.js");

const hostname = "0.0.0.0";
const port = 3001;
export default app.listen(port, hostname, () => {
	console.log(`Server running at http://localhost:${port}/`);
});
