/**
 * To be careful with signature width needs to be 
 * overridden depending on user signature.
 * 
 * Want to change date to litteral
 * 
 */

#let nbsp=sym.space.nobreak

#let cover-letter(
  first_name:"John",
  last_name:"Doe",
  town:"town",
  country:"country",
  telephone_number:"+xxx-xx-xx-xx-xx",
  mail_address:"@mail.com",
  
  to_company:"Addressed to company:",
  to_person:"Addressed to the Human Resources Department",
  to_address:"Addressed to residency and residency number",
  to_postal_code:"Residency located in:",
  from_location:"Addressed from following location",
  at_date:datetime.today(),

  job_identifier:"JOBID123456789",
  job_title:"Job Title",

  greeting:"Dear",
  to_recipient:"Mr - Mrs ",
  salutation:"Sincerely",
  signature:"../resources/signature.png",
  body
)={
  
  set text(font:"Calibri",size: 11pt)
    grid(
    columns: (1fr,1fr),
    rows:(2em,1em,1em,3em,1em,1em,1em,1.5em,2em),
    align: (left,right),

    grid.cell(
      x:0,
      y:0,
    )[#text(first_name,size:18pt,weight:450)#nbsp#text(last_name,size:18pt,weight:450)],

    grid.cell(
      x:0,
      y:1,
    )[#text(town),#nbsp#text(country)],

    grid.cell(
      x:0,
      y:2,
    )[#text(telephone_number)]
    
    ,grid.cell(
      x:0,
      y:3,
    )[#text(mail_address)]

    ,grid.cell(
      x:1,
      y:4,
    )[#text(to_company)]

    ,grid.cell(
      x:1,
      y:5,
    )[#text(to_person)]

    ,grid.cell(
      x:1,
      y:6,
    )[#text(to_address)]

    ,grid.cell(
      x:1,
      y:7,
    )[#text(to_postal_code)]

  ,grid.cell(
      x:1,
      y:8,
    )[#text(fill: color.gray)[#from_location, #at_date.display("[year]/[month]/[day]")]]

  ,grid.cell(
      x:0,
      y:9,
    )[#text(fill: color.gray)[Reference : #job_identifier#nbsp ·#nbsp #job_title]]
  )

  set text(font:"Helvetica",size:11pt)
  text()[#greeting#nbsp#to_recipient,]
  parbreak()
  set par(
    first-line-indent:1.5em,
    spacing:2em,
    justify:true,
    linebreaks:"optimized"
  )
  body

    v(1.5em)
  grid(
    columns: (1fr,1fr),
    rows:(2em,1em,1fr),
    align: (left,right),

    grid.cell(
      x:0,
      y:0,
    )[#text()[#salutation,]]

    ,grid.cell(
      x:1,
      y:1,
    )[#first_name#nbsp#last_name]

    ,grid.cell(
        x:1,
        y:2,
      )[#block[#place(right,float:false,dx:30pt,dy:5pt,image(signature,width:150pt))]]

  )

}