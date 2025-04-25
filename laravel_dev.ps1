# laravel_dev.ps1

function ap {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Command,
        [string]$Arg1,
        [string]$Arg2
    )

    switch -Wildcard ($Command) {
        "-h" {
            Write-Host "📘 Liste des commandes ap disponibles :"
            Write-Host "  ap lc:{version} {nom}     => Créer un projet Laravel avec version"
            Write-Host "  ap pam {Nom}              => make:model avec -mcrsf"
            Write-Host "  ap pc {Nom}               => make:controller"
            Write-Host "  ap pm {Nom}               => make:model simple"
            Write-Host "  ap pt {Nom}               => make:test"
            Write-Host "  ap pi                     => composer install"
            Write-Host "  ap pu                     => composer update"
            Write-Host ""
            Write-Host "🆘 Pour l’aide spécifique à une commande, fais : ap <commande> -h"
            break
        }

        "lc" {
            if ($Arg1 -eq "-h") {
                Write-Host "🔹 ap lc:{version} {nom_project}"
                Write-Host "    Exemple : ap lc:11 harfang"
                Write-Host "    => Crée une app Laravel 11 dans le dossier harfang"
                break
            }
        }

        "pam" {
            if ($Arg1 -eq "-h") {
                Write-Host "🔹 ap pam {Nom}"
                Write-Host "    Exemple : ap pam Project"
                Write-Host "    => Crée un modèle avec migration, controller, resource, seeder, factory"
                break
            }
        }

        "pc" {
            if ($Arg1 -eq "-h") {
                Write-Host "🔹 ap pc {Nom}"
                Write-Host "    Exemple : ap pc UserController"
                Write-Host "    => Crée un controller simple"
                break
            }
        }

        "pm" {
            if ($Arg1 -eq "-h") {
                Write-Host "🔹 ap pm {Nom}"
                Write-Host "    Exemple : ap pm Project"
                Write-Host "    => Crée un modèle simple"
                break
            }
        }

        "pt" {
            if ($Arg1 -eq "-h") {
                Write-Host "🔹 ap pt {Nom}"
                Write-Host "    Exemple : ap pt UserTest"
                Write-Host "    => Crée un test PHPUnit"
                break
            }
        }

        "pi" {
            if ($Arg1 -eq "-h") {
                Write-Host "🔹 ap pi"
                Write-Host "    => Lance composer install"
                break
            }
        }

        "pu" {
            if ($Arg1 -eq "-h") {
                Write-Host "🔹 ap pu"
                Write-Host "    => Met à jour les dépendances avec composer update"
                break
            }
        }

        "lc:*" {
            $version = $Command.Split(":")[1]
            $projectName = $Arg1
            Write-Host "🔧 Création d'une app Laravel $version nommée $projectName..."
            composer create-project laravel/laravel:$version $projectName
            break
        }

        "pam" {
            php artisan make:model $Arg1 -mcrsf
            break
        }

        "pc" {
            php artisan make:controller $Arg1
            break
        }

        "pm" {
            php artisan make:model $Arg1
            break
        }

        "pt" {
            php artisan make:test $Arg1
            break
        }

        "pi" {
            composer install
            break
        }

        "pu" {
            composer update
            break
        }

        default {
            Write-Host "Commande inconnue : $Command"
            Write-Host "Tape 'ap -h' pour la liste des commandes."
        }
    }
}
