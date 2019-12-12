FROM fr3akyphantom/droid-builder:latest

LABEL "com.github.actions.name"="Droid Builder Action"
LABEL "com.github.actions.description"="GitHub Actions for Android ROM Builds"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/rokibhasansagar/actions_droid-builder"
LABEL "homepage"="https://github.com/rokibhasansagar/actions_droid-builder"
LABEL "maintainer"="rokibhasansagar"

COPY entrypoint.sh /

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
