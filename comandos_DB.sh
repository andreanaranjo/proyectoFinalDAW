#!/bin/bash
# Models
rails g model announcement title:string fulltext:text member:references
rails g model assignment member:references task:references score:integer
rails g model post_comment content:string post:references author:string member:references title:string
rails g model event name:string desc:text due_time:datetime
rails g model member name:string last_name:string dob:date date_ingreso:date position:references
rails g model position name:string desc:text
rails g model post member:references content:text title:string
rails g model task name:string desc:text deadline:datetime event:references completed:boolean
# Scaffold controllers as APIs
rails g scaffold_controller api/v1/announcement --api
rails g scaffold_controller api/v1/assignment --api
rails g scaffold_controller api/v1/post_comment --api
rails g scaffold_controller api/v1/event --api
rails g scaffold_controller api/v1/member --api
rails g scaffold_controller api/v1/position --api
rails g scaffold_controller api/v1/post --api
rails g scaffold_controller api/v1/task --api
