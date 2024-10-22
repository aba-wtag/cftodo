<cfquery name="tasks">
    select * from tasks;
</cfquery>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CFtodo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1 class="text-center">CFtodo</h1>

        <table class="table mx-auto" style="max-width: 600px;">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Task</th>
                    <th scope="col">Time</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfset count=0/>
                <cfoutput query="tasks">
                    <tr>
                        <cfset count = count + 1/>
                        <th scope="row">#count#</th>
                        <td>#name#</td>
                        <td>#dateTimeFormat(time, 'EEE MMM dd HH:nn')#</td>
                        <td>
                            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="##editTaskModal" onclick="populateEditModal('#id#', '#name#')">Edit</button>
                            <a class="btn btn-danger" href="delete.cfm?id=#id#">Delete</a>
                        </td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>

        <div class="text-center">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTaskModal">Add</button>
        </div>
    </div>

    <!-- Add Modal -->
    <div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addTaskModalLabel">Add New Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addTaskForm" method="POST" action="insert.cfm">
                        <div class="mb-3">
                            <label for="taskName" class="form-label">Task Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Task</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="editTaskModal" tabindex="-1" aria-labelledby="editTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTaskModalLabel">Edit Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editTaskForm" method="POST" action="update.cfm">
                        <input type="hidden" id="editTaskId" name="id">
                        <div class="mb-3">
                            <label for="editTaskName" class="form-label">Task Name</label>
                            <input type="text" class="form-control" id="editTaskName" name="name" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Task</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        function populateEditModal(id, name) {
            document.getElementById('editTaskId').value = id;
            document.getElementById('editTaskName').value = name;
        }
    </script>
</body>
</html>
