

shinyUI(bootstrapPage(
    
    titlePanel(h1("Blood Bowl Casualties probabilities!", align = "center")),
    
    sidebarLayout(
        sidebarPanel( 
            selectInput(inputId = "armour",
                        label = "Armour Value",
                        choices = c(2,3,4,5,6,7,8,9,10,11),
                        selected = 8),
            fluidRow(
                column(12, 
                    p(h4("Attacker abilities")),
                    
                    checkboxInput(inputId = "claw",
                          label = "Claw",
                          value = FALSE),
                    helpText("Break any armour > 7 with 8+ roll"),
            
                    checkboxInput(inputId = "mb",
                          label = "Mighty Blow",
                          value = FALSE),
                    helpText("+1 to armour or injury rolls")
                ),
                
                column(12,
                       p(h4("Defender traits")),
                       checkboxInput(inputId = "niggling",
                                     label = "Niggling",
                                     value = FALSE),
                       helpText("+1 on Injury roll"),
                       checkboxInput(inputId = "stunty",
                                     label = "Stunty",
                                     value = FALSE),
                       helpText("+1 on Injury roll")
                )
            ),
            actionButton("gobutton", "Go!"),
            br()
            
        ),
        mainPanel(
            br(),
            uiOutput("tryon"),
            conditionalPanel(
                condition = "input.gobutton != 0",
                actionButton("rolldice", "Try your luck! Click here to roll your dices and kill a player!"),
                br(),
                uiOutput("rolldice")
                )
        )
    )    
))
