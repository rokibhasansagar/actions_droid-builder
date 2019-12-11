FROM fr3akyphantom/droid-builder:latest

LABEL "com.github.actions.name"="Android ROM Builder Action"
LABEL "com.github.actions.description"="GitHub Actions for Android build"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/rokibhasansagar/actions_droid-builder"
LABEL "homepage"="https://github.com/rokibhasansagar/actions_droid-builder"
LABEL "maintainer"="rokibhasansagar"

COPY entrypoint.sh /

USER builder

ENTRYPOINT [ "/entrypoint.sh" ]
