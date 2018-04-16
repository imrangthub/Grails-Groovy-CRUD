<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="layout" content="main">
    <title>Registration | Update</title>
</head>

<body>
<div class="row">
    <div class="col-md-8 col-md-offset-2"  style="margin-top: 30px;">
        <div class="col-md-6"><h4>Current data:</h4></div>
        <div class="col-md-6">
            <h4 style="color:green">${flash.message}</h4>
            <h4 style="color:red">${flash.error}</h4>
            <h4 style="color:#985f0d">${flash.warning}</h4>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <fieldset>

            <g:uploadForm name="myUpload" action="update">

                <table>
                    <tr>
                        <th>Name: </th>
                        <td><g:textField name="name" value="${profile.name}"/></td>
                    </tr>
                    <tr>
                        <th>Email: </th>
                        <td><g:textField name="email" value="${profile.email}" readonly="readonly" /></td>
                        <th style="color: red;">( You can't change email address )</th>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td><g:passwordField name="password" /></td>
                    </tr>
                    <tr>
                        <th>Current Photo</th>
                        <td><img src="${resource(dir: 'images', file: profile.photo)}" alt="Image" height="100" width="100"/></td>
                    </tr>
                    <tr>
                        <th>Update Photo</th>
                        <td><input type='file' name="photo"/></td>
                    </tr>
                </table>
                <g:hiddenField name="id" value="${profile.id}" />
                <div><g:submitButton name="Update" value="Update" class="bth btn-block btn-success"/></div>



            </g:uploadForm>

        </fieldset>

    </div>
</div>


<div class="row">
    <div class="col-md-4 col-md-offset-8"><g:link  action="index"><strong>Back</strong></g:link></div>

</div>


</body>
</html>