/**
 * 
 * Copyright 2025 uGyomm
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this
 * software and associated documentation files (the “Software”), to deal in the Software
 * without restriction, including without limitation the rights to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies
 * or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


/**
 * templates
 * lib-curriculum-vitae--standard.typ
 * 
 * Purpose
 * -------
 * 
 * This typesetting file (.typ) provides a 
 * standard curriculum vitae template.
 * 
 * To do
 * -----
 * 
 * Manage technical skills and hobbies using bicephalic information
 * 
 */

// CONSTANTS
// ---------
#let NAME_FONT_SIZE=25pt
#let JOB_FONT_SIZE=22pt
#let TITLE_FONT_SIZE=12pt
#let INFO_FONT_SIZE=10pt
#let DETAIL_FONT_SIZE=9pt
#let TITLE_COLOR=color.rgb("1B2D59")
#let DURATION_COLOR=color.rgb("969AA4")
#let BACKGROUND_COLOR=color.rgb("FDFCFB")
#let CHAPTER_FONT_SIZE=14pt
#let MISSION_FONT_SIZE=10pt

/**
 * Sets the template's page information.
 * 
 * Parameters
 * ----------
 * 
 * body : Sinking argument to provide curriculum vitae content
 * 
 * Notes
 * -----
 * 
 * This function should not be used externally.
 */
#let page_information(body)={
  set page(
  paper: "a4",
  margin:(top:3em,left:2.5em,right:2.5em,bottom:1.5em),
  )

  set text(
    font:"Calibri",
  )
  body
}

/**
 * Sets the template's header information.
 * 
 * Parameters
 * ----------
 * 
 * first_name         : Applicant's first name
 * last_name          : Applicant's last name
 * title          : Job's title
 * mail_address       : Applicant's mail address
 * telephone_number   : Applicant's telephone number
 * birthdate          : Applicant's birthdate
 * address            : Applicant's address
 * nationality        : Applicant's nationality
 * 
 * about              : Applicant's "about" paragraph
 * Notes
 * -----
 * 
 * This function should not be used externally.
 * 
 */
#let header_information(
  first_name:none,
  last_name:none,
  title:none,
  mail_address:none,
  telephone_number:none,
  birthdate:none,
  address:none,
  nationality:none,
  about:none,
)={ 
  block[
     #upper()[#text(weight:515,size:NAME_FONT_SIZE,fill:TITLE_COLOR)[
      #first_name #h(10pt,weak:true) #last_name\
     ]]
     #v(1em,weak:true)
     #upper()[#text(title,weight:250,size:JOB_FONT_SIZE)]
  ]
  v(1.3em,weak:true)

  grid(
    //Columns size is based on experience
    // it should expect the biggest length possible
    columns: (2em,35%,2em,100pt),
    rows:(16pt,2em),
    align: left,

    grid.cell(text(emoji.cake)),[#text(size:INFO_FONT_SIZE)[#birthdate #h(8pt,weak:false) · #h(8pt,weak:false)#nationality]],grid.cell(text(emoji.phone.classic)),[#text(telephone_number,size:INFO_FONT_SIZE)],grid.cell(text(emoji.mailbox.open)),[#text(address,size:INFO_FONT_SIZE)],grid.cell(text(emoji.mail.arrow)),[#text(mail_address,size:INFO_FONT_SIZE)]

  )
  place(
  top + right,
  dx: -5pt,
  dy:-5pt,
  rect(width: 75pt, height:85pt,fill: color.rgb("E6EBF2")),
)
  v(0.3em,weak:true)
  line(start:(10%,0%),length:85%,stroke:0.15pt + TITLE_COLOR)
  text(about,size:INFO_FONT_SIZE)
  v(0.3em,weak:true)
}
 

/**
 * Enumerates components.
 * 
 * Parameters
 * ----------
 * 
 * spacing    : Spacing length between components
 * values     : sinking parameter to enumerate components
 * 
 * Notes
 * -----
 * 
 * This function must not be called externally.
 * 
 */
#let information_values(spacing:none,..values)={
    let value=values
    .pos()
    .join()[#v(spacing,weak:true)]
  [#value]
}

/**
 * Creates a components' container.
 * 
 * Parameters
 * ----------
 * 
 * title      : Container's title
 * Components are "specialization" - oriented.
 * The purpose of this title parameter is to display the specialization
 * name
 * 
 * spacing          : Spacing length between containers
 * 
 * values           : sinking parameter to enumerate components
 * 
 */

#let information(
  title:"title",
  spacing:0.8em,
  ..values,
)={
    v(2.3em,weak:true)
    upper()[
      #v(10pt)
      #text(title,fill:TITLE_COLOR,size:CHAPTER_FONT_SIZE,weight:"bold")
      #box(baseline:-0.75pt,width: 1fr, line(length: 100%,
      stroke:0.15pt + TITLE_COLOR))
    ]
    
    v(spacing,weak:true)
    if values.pos().len()>0{
      information_values(spacing:spacing,..values)
    }

}

/**
 * Enumerates tools.
 * 
 * Parameters
 * ----------
 * tools        : sinking parameter to enumerate missions
 * 
 * Notes
 * -----
 * 
 * This function must not be called externally.
 * 
 */
#let tools_enum(..tools) = {
    let tool=tools
    .pos()
    .join()[#h(0.6em,weak:true)·#h(0.6em,weak:true)]

    text(size:DETAIL_FONT_SIZE,fill:DURATION_COLOR,weight:600)[
      #tool;]
    
}

/**
 * Enumerates missions.
 * 
 * Parameters
 * ----------
 * 
 * font_size    : Text font size for missions' name
 * missions     : sinking parameter to enumerate missions
 * 
 * Notes
 * -----
 * 
 * This function must not be called externally.
 * 
 */
#let missions_enum(font_size:MISSION_FONT_SIZE,..missions)={

    text(size:font_size)[#list(
      tight:true,
      marker:([•]),
      body-indent: 0.75em,
      ..missions)]
}

/**
 * Creates a "job experience" component.
 * 
 * Parameters
 * ----------
 * title                        : Job's title
 * company_name_and_address     : Company's name and address
 * Suggested layout is "Company Name, Town[· Country]"
 * Content inside bracket is optional if company's country and applicant's homecountry are identical
 * 
 * description                  : Short optional description.
 * span                         : Job experience's span.
 * missions                     : List of missions carried out
 * tools                        : List of tools used
 * 
 */
#let job_experience(
  title: "Job Title",
  company_name_and_address: "Company Name, Town[· Country]",
  description:none,
  span: "Month YYYY - Month YYYY",
  missions:("Mission A","Mission B","Mission C"),
  tools:("Tool A","Tool B","Tool C")
)={
  text(weight:"bold",size: TITLE_FONT_SIZE)[
    #title
    ]
  h(1fr)
  
  text(size: INFO_FONT_SIZE)[
    #span\
    ]
  
  v(0.4em,weak:true)
  text(size: INFO_FONT_SIZE)[
    #company_name_and_address
  ]
  h(1fr)

  tools_enum(..tools)

  if description != none {
      v(0.9em,weak:true)
      text(description,size:10pt)
  }
  v(0.75em,weak:true)
  missions_enum(..missions)
}

/**
 * Creates an "academic project" component.
 * 
 * Parameters
 * ----------
 * title                        : Project's title
 * duration : Project's duration
 * project  : Small description of tasks carried out for the project
 * 
 * is_first : Boolean to identify first appearing academic project
 * For readability, it is suggested that tools and project's span are shared between academic projects.
 * Hence, these should be displayed only at the level of the first academic project
 * span : Academic projects span
 * tools : Tools used for academic projects* 
 * 
 */

#let academic_project(
  title: "Title",
  duration:"XX hours",
  project:lorem(10),

  is_first:false,
  span:none,
  tools:none,
)={
  v(1.05em,weak:true)
  text(weight:"bold",size: TITLE_FONT_SIZE)[
    #title
    ]
  h(0.75em)
  text(style:"italic",size: DETAIL_FONT_SIZE,fill:DURATION_COLOR)[
    (#duration)
  ]
  
  
  if is_first and span != none {
    h(1fr,weak:true)
    text(size: INFO_FONT_SIZE)[
    #span
    ]
  }

  
  v(0.6em,weak:true)
  //enclosing in box to prevent linebreak to affect tools line
  box()[#text(size:INFO_FONT_SIZE)[
    #list()[#project]  
    ]]

  if is_first and tools != none{
    h(1fr)
    tools_enum(..tools)
  }

}

/**
 * Creates an "academic background" component.
 * 
 * Parameters
 * ----------
 * type : Academic background's type
 * span : Academic background's span
 * Usually academic backgrounds are quite long so the suggested format is "YYYY - YYYY".
 * However depending on the formation an other format might suit the context better like "Month YYYY - Month YYYY"
 * 
 * name_and_address : Academy name, Town [· Country]
 * Country can be optional if company's country and applicant's homecountry are identical
 */
#let academic_background(
  type:"Type",
  span:"YYYY - YYYY",
  name_and_address:"Name, Town [· Country] ",
  
)={
  v(1.05em,weak:true)
  text(weight:"bold",size: TITLE_FONT_SIZE)[
    #type
    ]
  h(1fr)
  
  text(size: INFO_FONT_SIZE)[
    #span\
    ]
  
  v(0.6em,weak:true)
  text(size:INFO_FONT_SIZE)[
    #name_and_address
  ]
}

#let footnote_info(
  date:datetime.today(),
  author: "John Doe",
  object: "Sheet",
  identifier: "0123456789"
)={
  
  align(bottom)[

    #text(date.display("[year]/[month]/[day]"),size:DETAIL_FONT_SIZE,fill:DURATION_COLOR) #h(1fr)
    #text(size:DETAIL_FONT_SIZE,fill:DURATION_COLOR)[#author · #object] #h(1fr) 
    #text(size:DETAIL_FONT_SIZE,fill:DURATION_COLOR)[#identifier]
    ]
  }

#let bi_title(
  left_title:"Left Title",
  right_title:"right title"
)=context{

  upper()[
      #v(10pt)
      #text(left_title,fill:TITLE_COLOR,size:CHAPTER_FONT_SIZE,weight:"bold")
      #box(baseline:-0.75pt,width: 1fr, line(length: 100%,
      stroke:0.15pt + TITLE_COLOR)) 
      #text(right_title,fill:TITLE_COLOR,size:CHAPTER_FONT_SIZE,weight:"bold")
  ]
  
}

#let CUSTOM_ALIGN=190pt
#let skill(
  skill_title:none,
  tools:none,
  language_name:none,
  language_level:none,
  language_certification:none,
)={
  v(0.65em,weak:true)

  grid(
    //Columns size is based on experience
    // it should expect the biggest length possible
    columns: (180pt,CUSTOM_ALIGN,5.5em,1.75em,1fr),
    align: left,
    column-gutter:1pt,
    [#smallcaps[#text(skill_title,weight:550,size:TITLE_FONT_SIZE)]], 
    [#text(tools,size:TITLE_FONT_SIZE)],
    [#smallcaps[#text(language_name,weight:550,size:TITLE_FONT_SIZE)]],
    [#text(language_level,size:TITLE_FONT_SIZE,weight:400)],
    [#text(language_certification,size:INFO_FONT_SIZE,style:"italic")]
  )
}

#let skill_and_hobby(
  skill_title:none,
  tools:none,
  hobby:"Hobbies",
)={
  v(0.65em,weak:true)

  grid(
    //Columns size is based on experience
    // it should expect the biggest length possible
    columns: (180pt,CUSTOM_ALIGN,1fr),
    align: left,
    column-gutter:1pt,
    [#smallcaps[#text(skill_title,weight:550,size:TITLE_FONT_SIZE)]], 
    [#text(tools,size:TITLE_FONT_SIZE)],
    [#upper(text(hobby,fill:TITLE_COLOR,size:TITLE_FONT_SIZE,weight:"bold"))
    //don't know why line length has to be so big
    #box(baseline:-0.75pt,width: 1fr, line(length:100%,
      stroke:0.15pt + TITLE_COLOR))
    ]      
  )
}


#let skill_and_hobbies(
  skill_title:none,
  tools:none,
  hobby1:"Obione",
  hobby2:"Hobby2",
  hobby3:"Hobby3"
)={
  v(0.65em,weak:true)

  grid(
    //Columns size is based on experience
    // it should expect the biggest length possible
    columns: (180pt,CUSTOM_ALIGN,1fr),
    align: left,
    column-gutter:1pt,
    [#smallcaps[#text(skill_title,weight:550,size:TITLE_FONT_SIZE)]], 
    [#text(tools,size:TITLE_FONT_SIZE)],
    [#smallcaps[#text(weight:550,size:INFO_FONT_SIZE)[
      #hobby1 #h(1fr,weak:true) #hobby2 #h(1fr,weak:true)#hobby3]]]
  )
}

#let curriculum_vitae(
  first_name:"John",
  last_name:"Doe",
  title:"Layout Architect",
  mail_address:"johndoe@mail.com",
  telephone_number:"+xxx xx xx xx xx",
  birthdate:"DD/MM/YYYY",
  address:"Full address",
  nationality:"Nationality",
  about:lorem(25),

  content:none
)={
  show:page_information.with()
  header_information(
  first_name:first_name,
  last_name:last_name,
  title:title,
  mail_address:mail_address,
  telephone_number:telephone_number,
  birthdate:birthdate,
  address:address,
  nationality:nationality,
  about:about,
  )
  content
}