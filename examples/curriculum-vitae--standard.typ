#import "../lib/lib-curriculum-vitae--standard.typ":curriculum_vitae,information,job_experience,academic_project,academic_background,technical_skill_and_language_proficiency,technical_skill_and_title,technical_skill_and_other

// job experiences
// ---------------
#let job_experience_dummy=job_experience(
  
)

#let job_experience_dummy_description=job_experience(
  description:lorem(10),
)

// academic projects
// -----------------
#let academic_project_first_dummy=academic_project(
  is_first: true,
  span:"Month YYYY - Month YYYY",
  tools:("Tool A","Tool B","Tool C")
)

#let academic_project_dummy=academic_project(
)

// academic backgrounds
// --------------------
#let academic_background_dummy=academic_background()

// technical skills and languages' proficiency
// ----------------------------------------
#let technical_skill_and_language_proficiency_dummy=technical_skill_and_language_proficiency(
  technical_field: "Technical Field",
  tools:("Tool A","Tool B","Tool C"),
  language:"Language",
  cefr_level: "XX",
  certification: "Certification (YYYY)"
)

#let technical_skill=technical_skill_and_language_proficiency(
  technical_field: "Technical Field",
  tools:("Tool A","Tool B","Tool C"),
)

// technical skill and a title
// ---------------------------
#let technical_skill_and_title_dummy=technical_skill_and_title(
  title:"Hobbies"
)

// technical skill and additional information
// ------------------------------------------
#let technical_skill_and_other=technical_skill_and_other(
  other:"Hobby A - Hobby A - Hobby A"
)


// using template
// --------------
#curriculum_vitae(
  content:[
        #information(
        left_title:"job experiences",
        spacing: 1em,
        ..arguments(
          job_experience_dummy_description,
          job_experience_dummy,
          job_experience_dummy
        )
    )

    #information(
      left_title:"academic projects",
      spacing:1em,
      ..arguments(
        academic_project_first_dummy,
        academic_project_dummy,
        academic_project_dummy
      )
    )

    #information(
      left_title:"academic backgrounds",
      spacing:0.75em,
      ..arguments(
        academic_background_dummy,
        academic_background_dummy,

      )
    )

    
    #information(
      left_title:"technical skills",
      right_title:"language proficiencies",
      spacing:0.75em,
      ..arguments(
          technical_skill_and_language_proficiency_dummy,
          technical_skill_and_language_proficiency_dummy,
          technical_skill,
          technical_skill_and_title_dummy,
          technical_skill_and_other
      )
    )
  ]
)
