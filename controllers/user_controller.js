const prisma = require("../src/connection");

//roles


module.exports.createroles = function (req, res) {
  const { role_name, role_desc } = req.body;
  prisma.roles
    .create({
      data: {
        role_name,
        role_desc,
      },
    })
    .then((roles) => {
      res.json(roles);
    });
};

module.exports.getAllsroles = function (req, res) {
  prisma.roles.findMany().then((roles) => {
    res.json(roles);
  });
};

module.exports.getOneroles = function (req, res) {
  const { id } = req.params;
  prisma.roles.findUnique({ where: { id: Number(id) } }).then((roles) => {
    res.json(roles);
  });
};

//



//User
module.exports.getAllsUser = function (req, res) {
  prisma.User.findMany().then((User) => {
    res.json(User);
  });
};

module.exports.createUser = function (req, res) {
  const { user_name, user_password, user_email, role_id } = req.body;
  prisma.User
    .create({
      data: {
        user_name,
        user_password,
        user_email,
        role_id
      },
    })
    .then((User) => {
      res.json(User);
    });
};

module.exports.updateUser = function (req, res) {
  const { id } = req.params;
  const { user_name, user_password, user_email, roles_id } = req.body;
  prisma.User
    .update({
      where: { id: Number(id) },
      data: {
        user_name,
        user_password,
        user_email,
        user_avatar,
        roles_id,
      },
    })
    .then((User) => {
      res.json(User);
    });
};

module.exports.deleteUser = function (req, res) {
  const { id } = req.params;
  prisma.User
    .delete({
      where: { id: Number(id) },
    })
    .then((User) => {
      res.json(User);
    });
};

//login

module.exports.login = function (req, res) {
  const { user_email, user_password } = req.body;
  prisma.User
    .findUnique({
      where: {
        "user_email": user_email
      },
    }).then((User) => {
      if (User.user_password === user_password) {
        if (User.role_id === 1) {
          prisma.Student.findFirst({
            where: { user_id: User.id }
          }).then(result => res.json(result))
        }
        else if (User.role_id === 2) {
          prisma.Lecturer.findFirst({
            where: { user_id: User.id }
          }).then(result => res.json(result))
        }
      }
      else {
        console.log(user_password)
        res.status(401).json({
          message: "Incorrect password"
        })
      }
    }
    )
}



//Student
module.exports.getAllsStudent = async function (req, res) {
  const students = await prisma.Student.findMany()
  const result = await Promise.all(students.map((Student) => {
    return user = prisma.User.findUnique({
      where: {
        id: Student.user_id
      }
    }).then((user) => {
      return {
        id: Student.id,
        uid: user.id,
        username: user.user_name,
        stu_id: Student.stu_id,
        stu_email: user.user_email,
        stu_grade: Student.stu_grade,
        stu_faculty: Student.stu_faculty,
        stu_major: Student.stu_major
      }
    })

  }))
  res.json(result)
};


module.exports.createStudent = function (req, res) {
  const { stu_id, stu_major, stu_grade, stu_faculty, avatar, user_id } = req.body;
  prisma.Student
    .create({
      data: {
        stu_id,
        stu_major,
        stu_grade,
        stu_faculty,
        user_id,
        avatar

      },
    })
    .then((Student) => {
      res.json(Student);
    });
};

module.exports.updateStudent = function (req, res) {
  const { id } = req.params;
  const { stu_id, stu_major, stu_grade, stu_faculty, pro_id } = req.body;
  prisma.Student
    .update({
      where: { id: Number(id) },
      data: {
        stu_id,
        stu_major,
        stu_grade,
        stu_faculty,
        pro_id
      },
    })
    .then((Student) => {
      res.json(Student);
    });
};

module.exports.deleteStudent = function (req, res) {
  const { id } = req.params;
  prisma.Student
    .delete({
      where: { id: Number(id) },
    })
    .then((Student) => {
      res.json(Student);
    });
};




module.exports.deleteAllsStudent = async function (req, res) {
  const { sid, uid } = req.params;
  prisma.Student
    .delete({
      where: { id: Number(sid) },
    }).then((Student) => {
      prisma.User
        .delete({
          where: { id: Number(uid) },
        }).then((response) => res.json("delete successfully"))
    })


};



//lecturer
module.exports.getAllLecturer = async function (req, res) {
  const Lecturers = await prisma.Lecturer.findMany()
  const result = await Promise.all(Lecturers.map((Lecturer) => {
    return user = prisma.User.findUnique({
      where: {
        id: Lecturer.user_id
      }
    }).then((user) => {
      return {
        id: Lecturer.id,
        uid: user.id,
        username: user.user_name,
        lect_id: Lecturer.lect_id,
        lect_roomnum: Lecturer.lect_roomnum,
        avatar: Lecturer.avatar,
      }
    })

  }))
  res.json(result)
};

module.exports.getAllsLecturer = function (req, res) {
  prisma.Lecturer.findMany().then((Lecturer) => {
    res.json(Lecturer);
  });
};

module.exports.createLecturer = function (req, res) {
  const { lect_roomnum, avatar, user_id } = req.body;
  prisma.Lecturer
    .create({
      data: {
        lect_roomnum,
        user_id,
        avatar

      },
    })
    .then((Lecturer) => {
      res.json(Lecturer);
    });
};

module.exports.updateLecturer = function (req, res) {
  const { id } = req.params;
  const { lect_roomnum, avatar, user_id } = req.body;
  prisma.Lecturer
    .update({
      where: { id: Number(id) },
      data: {
        lect_roomnum,
        user_id,
        avatar
      },
    })
    .then((Lecturer) => {
      res.json(Lecturer);
    });
};

module.exports.deleteStudent = function (req, res) {
  const { id } = req.params;
  prisma.Lecturer
    .delete({
      where: { id: Number(id) },
    })
    .then((Lecturer) => {
      res.json(Lecturer);
    });
};

//problem
module.exports.getAllsProblem = function (req, res) {
  const { lid, sid } = req.query
  console.log(lid)
  if (lid) {
    prisma.Problem.findMany({
      where: { lect_id: Number(lid) },
    }).then((Problem) => {
      res.json(Problem);
    });
  } else if (sid) {
    prisma.Problem.findMany({
      where: { sid: Number(sid) },
    }).then((Problem) => {
      res.json(Problem);
    });
  }
  else {
    prisma.Problem.findMany().then((Problem) => {
      res.json(Problem);
    });
  }
};

module.exports.createProblem = function (req, res) {
  const { pro_title, pro_type, pro_desc, pro_image, lect_id, sid } = req.body;
  prisma.Problem
    .create({
      data: {
        pro_title,
        pro_type,
        pro_desc,
        pro_image,
        lect_id,
        sid
      },
    })
    .then((Problem) => {
      res.json(Problem);
    });
};

module.exports.updateProblem = function (req, res) {
  const { id } = req.params;
  const { pro_title, pro_type, pro_desc } = req.body;
  prisma.Problem
    .update({
      where: { id: Number(id) },
      data: {
        pro_title,
        pro_type,
        pro_desc,
      },
    })
    .then((Problem) => {
      res.json(Problem);
    });
};

module.exports.deleteProblem = function (req, res) {
  const { pid } = req.params;
  prisma.Problem
    .delete({
      where: { id: Number(pid) },
    }).then((response) => res.json("delete successfully"))
};
