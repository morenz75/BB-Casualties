
dice <- vector(mode="integer", length=36)
d <- 1
for(i in 1:6) {
    for(t in 1:6) {
        dice[d] <- i+t
        d <- d +1
    }
}

checkArmourRoll <- function(roll) {
    result <-0
    if (roll > armour) result <- 1
    else if (roll + mb > armour) result <- 2
    return(result)
}

checkInjuryRoll <- function(roll, tMb) {
    result <-0
    if (roll > 9) result <- 1
    else if (roll+tMb > 9) result <- 2
    return(result)
}

mb <- 0
niggling <-0
stunty <- 0
armour <- 7

shinyServer(function(input, output) {
        
    output$tryon <- renderUI({ 
        #input$gobutton
        if (input$gobutton==0) {
            HTML("Please select your parameter on left panel and click Go button!")
        }
        else
            isolate({
                claw <<-0
                mb <<- 0
                niggling <<-0
                stunty <<- 0
                armour <<- 7
                input$rolldice==0
                armour <<- as.integer(input$armour)
                if (input$claw==1 & armour > 7) {armour <<- 7}
                if (input$niggling==1) niggling <<- 1
                if (input$stunty==1) stunty <<- 1
                
                if (input$mb==1) {
                    mb <<- 1
                    prob <- (sum(dice>(armour - 1))/36)*(sum(dice>(9-niggling-stunty))/36) 
                        + (sum(dice>armour)/36)*(sum(dice>(9-niggling-stunty-1))/36)
                } else {
                    prob <- (sum(dice>armour)/36)*(sum(dice>(9-niggling-stunty))/36)
                }
                HTML(paste("<span style=\"font-weight: string; color: #000000;\">
                           You have <b>",formatC(prob*100, digits=3), "%</b> probabilities to score a Casualty, 
                           and ", formatC(prob*(1/6)*100, digits=3), "% to kill the player!</span><br><br>"))
                
            })
    })
    
    output$rolldice <- renderUI({
        if (input$rolldice!=0) {
            isolate({
                armourRoll <- sum(sample(6, 2, replace = TRUE))
                tmpMb <- mb
                strMbArmour <- ""
                strMbInjury <- ""
                verifyArmourRoll <- checkArmourRoll(armourRoll)
                if (verifyArmourRoll > 0) {
                    injuryRoll <- sum(sample(6, 2, replace = TRUE))
                    if (verifyArmourRoll == 2) {
                        tmpMb <- 0
                        strMbArmour <- " (w/MB) "
                    }
                    verifyInjuryRoll <- checkInjuryRoll(injuryRoll+stunty+niggling, tmpMb)
                    if (verifyInjuryRoll == 2) {
                        strMbInjury <- " w/MB "
                    }
                    if (verifyInjuryRoll == 0) {
                        HTML(paste("<br>Armour roll: ", armourRoll, strMbArmour, " <span style=\"color: green\">Passed!</span><br>
                                   Injury roll: ", injuryRoll ,"<span style=\"color: #ff0000\">No casualty!</span>"))
                    } else {
                        
                        killRoll <- sample(6, 1)
                        
                        if (killRoll == 6) {
                            strKill <- paste("<br>Kill roll: ", killRoll, "<span style=\"color: green\">Yeah! You did it!!!</span>")
                        } else {
                            strKill <- paste("<br>Kill roll: ", killRoll, "<span style=\"color: orange\">Damn! I can't imagine that this goblin is still alive!!</span>")
                        }
                        
                        HTML(paste("<br>Armour roll: ", armourRoll, strMbArmour, " <span style=\"color: green\">Passed!</span><br>
                                   Injury roll: ", injuryRoll ,"(+",niggling+stunty, strMbInjury,") <span style=\"color: green\">Casualty!</span>",
                                   strKill))
                    }
                } else {
                    HTML(paste("<br>Armour roll", armourRoll, " <span style=\"color: #ff0000\">Failed to break armour!</span>"))
                }
            })
            
        }
    })
    
})

