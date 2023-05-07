class AttributionsController < ApplicationController
    before_action -> { setup_locale "attributions" }

    def index
        @flaticon = [
            {
                iconset: "Sun icons",
                author: "Freepik",
                link: "Sun icons created by Freepik - Flaticon",
                href: "https://www.flaticon.com/free-icons/sun"
            },
            {
                iconset: "Wind icons",
                author: "Freepik",
                link: "Wind icons created by Freepik - Flaticon",
                href: "https://www.flaticon.com/free-icons/wind"
            },
            {
                iconset: "Temperature icons",
                author: "Freepik",
                link: "Temperature icons created by Freepik - Flaticon",
                href: "https://www.flaticon.com/free-icons/temperature"
            },
            {
                iconset: "Compass icons",
                author: "Freepik",
                link: "Compass icons created by Eucalyp - Flaticon",
                href: "https://www.flaticon.com/free-icons/compass"
            },
            {
                iconset: "North icons",
                author: "Freepik",
                link: "North icons created by Freepik - Flaticon",
                href: "https://www.flaticon.com/free-icons/north"
            },
            {
                iconset: "Pressure icons",
                author: "Freepik",
                link: "Pressure icons created by Freepik - Flaticon",
                href: "https://www.flaticon.com/free-icons/pressure"
            },
            {
                iconset: "Rain icons",
                author: "Umeicon",
                link: "Rain icons created by Umeicon - Flaticon",
                href: "https://www.flaticon.com/free-icons/rain"
            },
            {
                iconset: "Cold icons",
                author: "nawicon",
                link: "Cold icons created by nawicon - Flaticon",
                href: "https://www.flaticon.com/free-icons/cold"
            }
        ]
    end
end
