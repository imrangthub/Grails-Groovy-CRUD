<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="layout" content="main">
    <title>Profile | Show</title>
</head>

<body>
<h1 align="center">Admin profile:</h1>
<hr/>

<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <table>
            <tr>
                <th>Name: </th>
                <th>${profile.name}</th>
            </tr>
            <tr>
                <th>Email: </th>
                <th>${profile.email}</th>
            </tr>
            <tr>
                <th>Reg_Date: </th>
                <th>${profile.createdAt}</th>
            </tr>
            <tr>
                <th>Photo</th>
                <th><img src="${resource(dir: 'images', file: profile.photo)}" alt="Image" height="700" width="700"/></th>
            </tr>
        </table>
    </div>
</div>

</body>
</html>