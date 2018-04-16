package crud

class Registration {
    String name
    String email
    String password
    String photo
    Date createdAt = new Date()
    Date updatedAt = new Date()


    static constraints = {
        name blank: false, nullable: false
        email blank: false, nullable: false,unique:true
        password blank: false, nullable: false
        photo blank: false, nullable: false
    }
}
