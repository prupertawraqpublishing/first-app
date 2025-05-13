module.exports = {
    apps: [
      {
        name: "first-app",
        cwd: "/opt/first-app",
        script: "npm",
        args: "start",
        time: true,
        rotate_logs: true,
        merge_logs: true
      }
    ]
  };
