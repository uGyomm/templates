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
 * lib-curriculum-vitae--shutters.typ
 * 
 * Purpose
 * -------
 * 
 * This typesetting file (.typ) provides a curriculum vitae template named "shutters".
 * The name's stems from the CV's composition being divided
 * in two columns each containing multiple components that could be seen
 * as "shutters"
 * 
 */

// CONSTANTS
// ---------

#let NBSP=sym.space.nobreak //non-breaking space

#let DETAIL_COLOR=color.gray

#let APPLICANT_FONT_SIZE=25pt
#let APPLICANT_FONT_WEIGHT=625

#let APPLICATION_FONT_SIZE=20pt
#let APPLICATION_FONT_WEIGHT=500

#let SEPARATOR_STROKE_SIZE=0.35pt
#let SEPARATOR_COLOR=DETAIL_COLOR

#let INFORMATION_TITLE_FONT_SIZE=18pt
#let INFORMATION_TITLE_FONT_WEIGHT=450
#let INFORMATION_RAW_DESCRIPTION_FONT_SIZE=10pt

#let INFORMATION_UNDERLINE_STROKE_WEIGHT=2pt
#let INFORMATION_UNDERLINE_STROKE_COLOR=color.rgb("080808")
#let INFORMATION_UNDERLINE_STROKE=INFORMATION_UNDERLINE_STROKE_WEIGHT+INFORMATION_UNDERLINE_STROKE_COLOR


#let SPAN_FONT_SIZE=10pt
#let SPAN_FONT_COLOR=DETAIL_COLOR
#let SPAN_FONT_WEIGHT=650

#let ACADEMY_FONT_SIZE=12pt
#let ACADEMY_FONT_WEIGHT=550

#let LOCATION_FONT_SIZE=9pt

#let TECHNICAL_SKILL_CATEGORY_FONT_SIZE=12pt
#let TECHNICAL_SKILL_CATEGORY_FONT_WEIGHT=550

#let TOOL_FONT_SIZE=9pt
#let TOOL_FONT_COLOR=DETAIL_COLOR
#let TOOL_FONT_WEIGHT=650

#let JOB_TITLE_FONT_SIZE=13pt
#let JOB_TITLE_FONT_WEIGHT=550

#let JOB_SPAN_FONT_SIZE=JOB_TITLE_FONT_SIZE - 2pt
#let JOB_TOOL_FONT_SIZE=JOB_SPAN_FONT_SIZE - 1pt
#let JOB_LOCATION_FONT_SIZE=JOB_TOOL_FONT_SIZE

#let JOB_DESCRIPTION_FONT_SIZE=JOB_TITLE_FONT_SIZE - 2pt

#let MISSION_FONT_SIZE=JOB_DESCRIPTION_FONT_SIZE - 1pt

#let LANGUAGE_FONT_SIZE=12pt
#let LANGUAGE_FONT_WEIGHT=550

#let HOBBY_FONT_SIZE=12pt


#let CHAPTER_FONT_SIZE=18pt
#let TITLE_FONT_SIZE=12pt
//#let INFO_FONT_SIZE=10pt
#let FOOTNOTE_FONT_SIZE=9pt
#let FOOTFONT_FONT_COLOR=color.gray

#let TITLE_COLOR=color.rgb("1B2D59")

#let BACKGROUND_COLOR=color.rgb("FDFCFB")
#let CHAPTER_FONT_SIZE=14pt

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
#let page_info(body)={
  set page(
  paper: "a4",
  margin:(top:3em,left:2.5em,right:2.5em,bottom:1.5em),
  )
  body
}


/**
 * Sets the template's header information.
 * 
 * Parameters
 * ----------
 * 
 * first_name             : Applicant's first name
 * last_name              : Applicant's last name
 * job_title              : Job's title
 * birthdate              : Applicant's birthdate
 * birthdate_icon         : Icon to illustrate the birthdate
 * 
 * telephone_number       : Applicant's telephone number
 * telephone_number_icon  : Icon to illustrate the telephone number
 * 
 * address                : Applicant's full address
 * address_icon           : Icon to illustrate the address
 * 
 * mail_address           : Applicant's mail address
 * mail_address_icon      : Icon to illustrate the mail address
 * 
 * Notes
 * -----
 * 
 * This function should not be used externally.
 * 
 */
#let header_information(
  first_name:none,
  last_name:none,
  job_title:none,
  birthdate:none,
  birthdate_icon:none,

  telephone_number:none,
  telephone_number_icon:none,

  address:none,
  address_icon:none,

  mail_address:none,
  mail_address_icon:none,
)={
    let SYMBOL_SPACING=6pt
    grid(   
    columns: (30%,30%,1fr),
    rows:4,
    align: (bottom+left,bottom+center,bottom+right),
    column-gutter:3pt,
    row-gutter: 9pt,

    grid.cell(
      x:0,
      y:2,
      align:bottom,
    )[#text(first_name,
    weight:APPLICANT_FONT_WEIGHT,
    size:APPLICANT_FONT_SIZE)], 

    grid.cell(
      x:0,
      y:3,
      align:bottom,
    )[#text(last_name,
    weight:APPLICANT_FONT_WEIGHT,
    size:APPLICANT_FONT_SIZE)],

    grid.cell(
      x:1,
      rowspan:4,
      align:bottom,
    )[#text(job_title,
    size:APPLICATION_FONT_SIZE, 
    weight:APPLICATION_FONT_WEIGHT)], 

    // this is not robust, there is probably a way
    // but I'm not currently looking for it
    grid.cell(
      x:2,
      rowspan:4,
    )[#grid(
      columns:(2em,10em),
      align:(left,left),
      row-gutter: 10pt,
      grid.cell(
        x:0,
        y:0,

      )[#text(birthdate_icon)],
      grid.cell(
        x:0,
        y:1,
      )[#text(telephone_number_icon)],

      grid.cell(
        x:0,
        y:2,
      )[#text(mail_address_icon)],

      grid.cell(
        x:0,
        y:3,
      )[#text(address_icon)],

      grid.cell(
        x:1,
        y:0,
      )[#text(birthdate)],

      grid.cell(
        x:1,
        y:1,
      )[#text(telephone_number)],

      grid.cell(
        x:1,
        y:2,
      )[#text(mail_address)],

      grid.cell(
        x:1,
        y:3,
      )[#text(address)],)
      ]
    )
    
    box(baseline:0.3em, line(length:100%,stroke:SEPARATOR_STROKE_SIZE+ SEPARATOR_COLOR))
    v(1.5em)
}

/**
 * Creates an "academic background" component.
 * 
 * Parameters
 * ----------
 * 
 * span             : Academic background's span
 * Suggested span layout is "From YYYY to YYYY"
 * 
 * type            : Background's academic type
 * 
 * name and location         : Academy's name and location
 * Suggested layout is "Name, Town[· Country]"
 * Bracket content is optional if the application's country and academy country
 * are identical. Otherwise, it is Suggested.
 * 
 */
#let academic_background(
  span:"YYYY - YYYY",
  type:"Background's academic type",
  name_and_location:"Name, Town[· Country]",
)={
  grid(
    rows:(0.55em,0.75em,0.7em),
    row-gutter: 6pt,
    grid.cell(
      x:0,
      y:0,
    )[#text(span,
    size:JOB_SPAN_FONT_SIZE+1pt,
    fill:SPAN_FONT_COLOR)
    ],
    
    grid.cell(
      x:0,
      y:1,
    )[#text(type,
    size:ACADEMY_FONT_SIZE,
    weight:ACADEMY_FONT_WEIGHT)
    ],

    grid.cell(
      x:0,
      y:2,
    )[#text(name_and_location,
    size:LOCATION_FONT_SIZE,
    style:"italic")
    ],
  )
  }

/**
 * Enumerates tools.
 * 
 * Parameters
 * ----------
 * 
 * font_size    : Text font size for tools' name
 * tools        : sinking parameter to enumerate tools
 * 
 * Notes
 * -----
 * 
 * This function must not be called externally.
 * 
 */
#let tools_enum(font_size:TOOL_FONT_SIZE,
  ..tools) = {
    let tool=tools
    .pos()
    .join()[#h(0.4em,weak:true)·#h(0.4em,weak:true)]

    text(size:font_size,
    fill:TOOL_FONT_COLOR,
    weight:TOOL_FONT_WEIGHT)[
      #tool;]
    
}



/**
 * Creates a "technical skill" component.
 * 
 * Parameters
 * ----------
 * 
 * category       : Technical skill's category name
 * below_space    : Length to modify space left below component
 * tools          : sinking parameter to lists mastered tools 
 * provided as "Typst arguments"
 * 
 */
#let technical_skill(
  category:"category",
  below_space:0em,
  ..tools,
)={
  grid(
    columns:(0.5fr,1fr),
    align:(left,right),
    grid.cell(
      x:0,
      y:0,
    )[#text(category,
    size:TECHNICAL_SKILL_CATEGORY_FONT_SIZE,
    weight:TECHNICAL_SKILL_CATEGORY_FONT_WEIGHT)],

    grid.cell(
      x:1,
      y:0,
    )[#tools_enum(font_size: 12pt,
      ..tools)]
  )

  v(below_space,weak:true)
}

/**
 * Creates a "language proficiency" component.
 * 
 * Parameters
 * ----------
 * 
 * language       : Language's name
 * cefr_level     : CEFR's level(Common European Framework of Reference for
 * Languages) 
 * certification  : Certification's information
 * Suggested layout for certification is Certification's name(Certification's
 * date)[: Certification's score]. Content in bracket is optional.
 * 
 */
#let language_proficiency(
  language:"Language",
  cefr_level:"XX",
  certification:"certification information",
)={
  grid(
    columns:(28%,2.5em,1fr),
    grid.cell(
      x:0,
      y:0,
    )[#text(language,
    size:LANGUAGE_FONT_SIZE,
    weight:LANGUAGE_FONT_WEIGHT)],

    grid.cell(
      x:1,
      y:0,
    )[#text(cefr_level,size:TITLE_FONT_SIZE,weight:400)],

    grid.cell(
      x:2,
      y:0,
    )[#text(certification,size:TITLE_FONT_SIZE,weight:300,style:"italic")],
  )
}

/**
 * Creates a "hobby" component.
 * 
 * Parameters
 * ----------
 * 
 * icon       : Emoji or symbol to illustrate the hobby
 * hobby      : Hobby's names 
 */
#let hobby(
  icon:emoji.face,
  hobby:"hobby"
)={
  grid(
    columns:(3em,1fr),
    grid.cell(
      x:0,
      y:0,
    )[#text(icon,size:HOBBY_FONT_SIZE)],

    grid.cell(
      x:1,
      y:0,
    )[#text(hobby,
    size:HOBBY_FONT_SIZE)],)
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
 * raw_description  : String to display a raw description as component
 * 
 * values           : sinking parameter to enumerate components
 * 
 * span             : Container's span
 * Use this parameter in case the components don't possess their own 
 * span but can be displayed under a common one
 * 
 * tools            : Container's tools list
 * Use this parameter in case the components don't possess their own
 * tools list but can be displayed under a common one
 * 
 * values           :List of components
 * a shared span but do not possess each their own.
 * 
 * Notes
 * -----
 * 
 * If both raw_description and values parameters have been set,
 * values parameter takes priority over raw_description.
 * 
 * To improve readibility, it is suggested to couple raw_description
 * only with the "title" parameter.
 * 
 */

#let information(
  title:"title",
  spacing:0.8em,
  raw_description:none,
  span:none,
  tools:none,
  ..values,
)={
    v(2.3em,weak:true)
    text(title,
    size:INFORMATION_TITLE_FONT_SIZE,
    weight:INFORMATION_TITLE_FONT_WEIGHT)
    box(baseline:3pt, line(length:100%,stroke:INFORMATION_UNDERLINE_STROKE))
    v(1.2em,weak:true)

    if span != none and tools!= none{
      grid(
        rows:(1.35em,0.1em),
        grid.cell(
          x:0,
          y:0,
        )[#text(span,
        size:12pt
        )],

        grid.cell(
          x:0,
          y:1,
        )[#tools_enum(font_size:12pt,..tools)])
    }
    if values.pos().len()>0{
      information_values(spacing:spacing,..values)
    }
    else if raw_description != none{
      text(raw_description,
    size:INFORMATION_RAW_DESCRIPTION_FONT_SIZE,
    style:"italic")
    }
}

/**
 * Sets the template's footer information.
 * 
 * Parameters
 * ----------
 * 
 * date : Application's date
 * first_name : Applicant's first name
 * last_name : Applicant's last name
 * document : Document's name 
 * identifier : Application's identifier
 * 
 * Notes
 * -----
 * 
 * This function must not be called externally.
 * 
 */
#let footer_information(
  date:none,
  first_name: none,
  last_name:none,
  document: none,
  identifier: none
)={
  
  align(bottom)[

    #text(date.display("[year]/[month]/[day]"),size:FOOTNOTE_FONT_SIZE,fill:FOOTFONT_FONT_COLOR) #h(1fr)
    #text(size:FOOTNOTE_FONT_SIZE,fill:FOOTFONT_FONT_COLOR)[#first_name#NBSP#last_name · #document] #h(1fr) 
    #text(size:FOOTNOTE_FONT_SIZE,fill:FOOTFONT_FONT_COLOR)[#identifier]
    ]
  }

/**
 * Enumerates missions.
 * 
 * Parameters
 * ----------
 * 
 * font_size    : Text font size for missions' name
 * missions        : sinking parameter to enumerate missions
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
 * 
 * is_first : Boolean to declare the first / the oldest job experience
 * When set, this parameter removes the job experience separator
 * 
 * title : Job experience's title
 * location : Job experience's location
 * span : Job experience's span.
 * Suggested layout is "Month YYYY - Month YYYY"
 * 
 * description : Job experience's description.
 * To improve readability, minimize description's length.
 * 
 * missions : List of missions carried out during the job experience
 * tools : List of tools used during the job experience
 * 
 * 
 */
#let job_experience(
  is_first:false,
  title:"job_title",
  location:"location",
  span:"Month YYYY - Month YYYY",
  description:none, // no description is expected
  missions:("Mission A","Mission B","Mission C"),
  tools:("Tool A","Tool B","Tool C")
)={
  grid(
    columns:(1fr,1fr),
    align:(left+bottom,right+bottom),
    row-gutter: 0.6em,
    grid.cell(
      x:0,
      y:0
    )[#text(title,
    size:JOB_TITLE_FONT_SIZE,
    weight:JOB_TITLE_FONT_WEIGHT)],

    grid.cell(
      x:1,
      y:0,
    )[#text(span,
    size:JOB_SPAN_FONT_SIZE
    )],

    grid.cell(
      colspan:2,
      y:1,
    )[#grid(
      columns:(1fr,1fr),
      align:(left+bottom,right+bottom),
      grid.cell(
      x:0,
      y:0,
      )[#text(location,
    size:JOB_LOCATION_FONT_SIZE, 
    style:"italic")],

    grid.cell(
      x:1,
      y:0
    )[#tools_enum(font_size: JOB_TOOL_FONT_SIZE, ..tools)]
    )]
  )

  v(0.9em,weak:true)
  text(description,size:JOB_DESCRIPTION_FONT_SIZE)
  v(0.7em,weak:true)
  missions_enum(..missions)

  //the first experience is the lowest one in order.
  //we don't want to display experience separator for it
  if not is_first {
    box(baseline:3pt, line(length:100%,stroke:0.15pt + SEPARATOR_COLOR))
  }

}

/**
 * Creates an "academic project" component.
 * 
 * Parameters
 * ----------
 * 
 * title : Project's title
 * missions : List of missions carried out during the academic project
 * duration : Project's duration (Suggested to give in hours) 
 * 
 */
#let academic_project(
  title:"Project's title",
  missions:("Mission A","Mission B","Mission C"),
  duration:"XX hours",
)={

  grid(
    columns:(1fr,4em),
    align:(left+bottom,right+bottom),
    row-gutter: 0.8em,
    grid.cell(
      x:0,
      y:0
    )[#text(title,size:12pt,
    weight:JOB_TITLE_FONT_WEIGHT)],

    grid.cell(
      colspan:2,
      y:1
    )[#missions_enum(font_size:11pt,..missions)],

    grid.cell(
      x:1,
      y:0
    )[#text(size:10pt,style:"italic",fill:color.gray)[(#duration)]],
  )
}

/**
 * Creates the curriculum vitae "shutter" template.
 * 
 * Parameters
 * ----------
 * 
 * left_content : CV's left content.
 * right_content : CV's right content.
 * 
 * For :
 * "first_name"
 * "last_name"
 * "job_title"
 * "birthdate"
 * "birthdate_icon"
 * "telephone_number"
 * "telephone_number_icon"
 * "address"
 * "address_icon"
 * "mail_address"
 * "mail_address_icon"
 * please refer to @header_information documentation
 * 
 * For :
 * "date"
 * "document"
 * "identifier"
 * please refer to @footer_information
 * 
 * Notes
 * -----
 * 
 * "left_content" and "right_content" parameters Suggested usage
 * involves content block. Inside the content block, information must be 
 * ordered as desired.
 * 
 */
#let curriculum_vitae(
  left_content:"left_content",
  right_content:"right_content",

  first_name:"John",
  last_name:"Doe",
  job_title:"Layout Architect",
  birthdate:"DD/MM/YYYY",
  birthdate_icon:emoji.cake,

  telephone_number:"+xxx xx xx xx xx",
  telephone_number_icon:emoji.phone.classic,

  address:"full address",
  address_icon:emoji.mailbox.open,

  mail_address:"johndoe@mail.com",
  mail_address_icon:emoji.mail.arrow,

  date:datetime.today(),
  document: "Curriculum Vitae",
  identifier: "JOBID0123456789"

)={
  show:page_info.with()
  header_information(
    first_name:first_name,
    last_name:last_name,
    job_title:job_title,
    birthdate:birthdate,
    birthdate_icon:birthdate_icon,

    telephone_number:telephone_number,
    telephone_number_icon:telephone_number_icon,

    address:address,
    address_icon:address_icon,

    mail_address:mail_address,
    mail_address_icon:mail_address_icon,

  )
  grid(
    columns:(40%,3em,1fr),
    //second column is empty to provide air
    grid.cell(
      x:0,
      y:0,
    )[#left_content],

    grid.cell(
      x:2,
      y:0,
    )[#right_content]
  )

  footer_information(
    date:date,
    first_name: first_name,
    last_name:last_name,
    document:document,
    identifier:identifier
)
}



