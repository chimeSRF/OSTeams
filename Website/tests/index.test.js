import chai from "chai";
import chaiHttp from "chai-http";
import server from "../index.js";

chai.should();
chai.use(chaiHttp);

describe("Test index page", () => {
	describe("GET /", () => {
		it("It should Load the page.", (done) => {
			chai.request(server)
				.get("/")
				.end((err, response) => {
					response.should.have.status(200);
				});
			done();
		});
	});
});