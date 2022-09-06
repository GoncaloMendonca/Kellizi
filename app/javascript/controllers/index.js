// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChangeColorController from "./change_color_controller"
application.register("change-color", ChangeColorController)

import CardsController from "./cards_controller"
application.register("cards", CardsController)

import FormDisplayController from "./form_display_controller"
application.register("form-display", FormDisplayController)

import CompanyProductsController from "./company_products_controller"
application.register("company-products", CompanyProductsController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)
