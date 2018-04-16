package crud

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }


        // Book CRUD
        "/books"(controller: "books", action: "index")
        "/bookCreate"(controller: "books", action: "create")

        "/registration"(controller: "registration")
        "/login"(controller: "login")



        "/check"(view:"/check")
        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
