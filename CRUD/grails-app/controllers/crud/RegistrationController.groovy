package crud

class RegistrationController {
    def index = {
        def adminList = Registration.list()
        [adminList:adminList]
    }

    def create() { }


    def registration = {
        def name = params.name
        def email = params.email
        def password = params.password
        def uploadedFile = params.photo

//        render uploadedFile
//        return

        if(name && email && password && uploadedFile){
            def fileName = uploadedFile.originalFilename
            def matcher = (fileName =~ /.*\.(.*)$/)
            def extension = matcher[0][1]

            if(extension in ['jpg', 'jpeg', 'png']) {

                def uniqueName = new Date().time+"_"+fileName
                def f = request.getFile('photo')

                Registration regObj = new Registration(name: name, email: email, password: password, photo: uniqueName)
                if(regObj) {

                    regObj.save(flush: true)

                    f.transferTo(new File('D:/GRAILS AND GROOVY/CRUDeXAMPLE/CRUD/grails-app/assets/images/'+uniqueName))
                    flash.message = "Successfully registration completed."
                }

            } else {
                flash.warning = "Not a Image File"
            }
        }else{
            flash.error = "Registration Failed ( empty field)"
        }
        redirect(action: 'create')
    }

    def show(long id){
        def singleProfile = Registration.get(id)
        [ 'profile':singleProfile]
    }


    def edit(long id){
        def singleProfile = Registration.get(id)
        [ 'profile':singleProfile]
    }

    def update(long id){

        def name
        def email
        def password
        def updated_at = new Date()
        def uploadedFile = params.photo
        def oldFileName

        def currentProfile = Registration.get(id)
        name = currentProfile.name
        email = currentProfile.email
        password = currentProfile.password
        oldFileName = currentProfile.photo
        if(params.name){
            name = params.name
        }
        if(params.password){
            password = params.password
        }
        if(uploadedFile.originalFilename){
            def fileName = uploadedFile.originalFilename
            def matcher = (fileName =~ /.*\.(.*)$/)
            def extension = matcher[0][1]

            if(extension in ['jpg', 'jpeg', 'png']) {
                def  uniqueName = new Date().time+"_"+fileName
                def f = request.getFile('photo')


                Registration regObj = Registration.get(id)
                regObj.name = name
                regObj.email = email
                regObj.password = password
                regObj.photo = uniqueName
                if(regObj) {

                    regObj.save(flush: true)

                    f.transferTo(new File('D:/GRAILS AND GROOVY/CRUDeXAMPLE/CRUD/grails-app/assets/images/'+uniqueName))
                    def file = new File('D:/GRAILS AND GROOVY/CRUDeXAMPLE/CRUD/grails-app/assets/images/'+oldFileName)
                    file.delete()
                    flash.message = "Successfully Update completed with Photo."
                }

            }else{
                flash.warning = "Not a Image File"
                redirect(action: "edit", id: id)
                return
            }
        }else {
            Registration regObj = Registration.get(id)
            regObj.name = name
            regObj.email = email
            regObj.password = password
            regObj.photo = oldFileName
            if(regObj) {
                regObj.save(flush: true)
                flash.message = "Successfully Update completed."
            }

        }
        redirect(action: 'index')
    }

    def delete(long id) {
        Registration regObj = Registration.get(id)
        def file = new File('D:/GRAILS AND GROOVY/CRUDeXAMPLE/CRUD/grails-app/assets/images/'+regObj.photo)
        file.delete()
        regObj.delete( flush: true)
        flash.message = "Successfully deleted your data."
        redirect (action: 'index')
    }






}
