<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="layout" content="main">
    <title>Registration | Home</title>
</head>

<body>
<hr/>


<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div class="row">
    <div class="col-md-4" style="margin-top: 20px;"><strong><g:link controller="registration" action="create">Add new admin</g:link></strong></div>
</div>
<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <h4>Current admin list</h4>

        <table style="width: 100%; border: solid; margin-top: 10px;">
            <tr>
                <th>Serial No</th><th>Name</th><th>Email</th><th>Reg_Date</th><th>Photo</th><th>Action</th>
            </tr>

            <g:each in="${adminList}" var="singleAdmin" status="i">

                <tr>
                    <td>${i+1}</td>
                    <td>${singleAdmin.name}</td>
                    <td>${singleAdmin.email}</td>
                    <td><g:formatDate date="${singleAdmin.createdAt}" type="date" style="MEDIUM"/></td>
                    <td><img src="${resource(dir: 'images', file: singleAdmin.photo)}" alt="Image" height="100" width="100"/></td>
                    <td>
                        <g:link action="show" id="${singleAdmin.id}"> View </g:link><br/>
                        <g:link action="edit" id="${singleAdmin.id}"> Update </g:link><br/>
                        <g:link action="delete" id="${singleAdmin.id}"> Delete </g:link>
                    </td>
                </tr>

            </g:each>

        </table>
    </div>
</div>
<div class="row">
    <div class="col-md-3 col-md-offset-9"><g:link uri="/"><strong>HOME</strong></g:link></div>

</div>
<div style="margin-top: 200px;"></div>







</body>
</html>