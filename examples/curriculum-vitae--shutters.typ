#import "../lib/lib-curriculum-vitae--shutters.typ":curriculum_vitae,academic_background,technical_skill,information, language_proficiency,hobby,job_experience,academic_project

// about
// -----
#let about=lorem(25)
// academic backgrounds
// -------------------
#let academic_background_dummy=academic_background()

// technical skills
// ---------------
#let technical_skill_dummy=technical_skill(
  ..arguments("Tool A","Tool B","Tool C")
)

#let technical_skill_specimen=technical_skill(
  below_space: 1.65em,
  ..arguments("Tool X",)
)

// language proficiencies
// ----------------------
#let language_proficiency_dummy=language_proficiency()

// hobbies
// -------
#let hobby_dummy=hobby()

// job experiences
// ---------------
#let job_experience_dummy=job_experience(description: lorem(4))
#let job_experience_oldest_dummy=job_experience(is_first: true)

// academic projects
// -----------------
#let academic_project_dummy=academic_project()


// template
// --------
#curriculum_vitae(
  left_content: [
    #information(
        title:"about",
        raw_description: about
    )

        #information(
        title:"academic backgrounds",
        spacing: 1em,
        ..arguments(
            academic_background_dummy,
            academic_background_dummy,
            academic_background_dummy,
        )
    )

    #information(
        title:"technical skills",
        spacing: 1em,
        ..arguments(
            technical_skill_dummy,
            technical_skill_specimen,
            technical_skill_dummy,
            technical_skill_dummy,
            technical_skill_specimen,
            technical_skill_dummy
        )
    )

    #information(
        title:"language proficiencies",
        spacing: 1em,
        ..arguments(
            language_proficiency_dummy,
            language_proficiency_dummy,
        )
    )

    #information(
        title:"Hobbies",
        spacing: 1em,
        ..arguments(
            hobby_dummy,
            hobby_dummy,
            hobby_dummy
        )
    )
  ],

right_content: [
    #information(
        title:"job experiences",
        spacing: 1em,
        ..arguments(
            job_experience_dummy,
            job_experience_dummy,
            job_experience_oldest_dummy,
        )
    )

    #information(
        title:"academic projects",
        spacing: 1em,
        span:"Month YYYY - Month YYYY",
        tools:("Tool A","Tool B", "Tool C"),
        ..arguments(
            academic_project_dummy,
            academic_project_dummy,
            academic_project_dummy,
        )
    )
]
)
