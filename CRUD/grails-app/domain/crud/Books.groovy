package crud

class Books {
    String title
    String authority
    Date createdAt = new Date()


    static constraints = {

        title blank: false, nullable: false
        authority blank: false, nullable: false


    }






}
