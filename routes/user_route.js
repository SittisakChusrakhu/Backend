const router = require("express").Router();
const {
  getAllsroles,
  getOneroles,
  getAllsProblem,
  getAllsUser,
  getAllsStudent,
  getAllLecturer,
  createroles,
  createUser,
  createProblem,
  createStudent,
  createLecturer,
  updateUser,
  updateProblem,
  deleteUser,
  deleteStudent,
  deleteProblem,
  deleteAllsStudent,
  login,
} = require("../controllers/user_controller");

router.get("/users", getAllsroles);
router.get("/user/all", getAllsUser);
router.get("/user/problem",getAllsProblem);
router.get("/student/all", getAllsStudent);
router.get("/lecturer/all",getAllLecturer);
router.get("/user/:id", getOneroles);
router.post("/user/role", createroles);
router.post("/register", createUser);
router.post("/problem", createProblem);
router.post("/student", createStudent);
router.post("/lecturer", createLecturer);
router.post("/login", login);
router.put("/user/:id", updateUser);
router.put("/problem/update", updateProblem);
router.delete("/user/:id", deleteUser);
router.delete('/student/:sid/:uid',deleteAllsStudent);
router.delete('/problem/:pid', deleteProblem);


module.exports = router;
