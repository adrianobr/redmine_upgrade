# lembrar de atualizar as permissões no HOST: chmod -R a+w  /var/redmine_home/files/
echo "Atualizar/Upgrade do SO"
apt-get update && sudo apt-get upgrade

echo "Instalando o Build-Essential"
apt-get install build-essential

echo "Instalando o libstdc++6"
apt-get install libstdc++6

echo "Atualizando Locales"
apt-get purge locales
apt-get install locales
dpkg-reconfigure locales

echo "Configurando Data e Hora"
dpkg-reconfigure tzdata

echo "Instalando VI"
apt-get install vim

cd plugins

echo "Progressive Projects"
git clone https://github.com/stgeneral/redmine-progressive-projects-list.git progressive_projects_list

echo "Editor de Texto"
git clone https://github.com/a-ono/redmine_ckeditor.git redmine_ckeditor

echo "Issue Badge"
git clone https://github.com/akiko-pusu/redmine_issue_badge.git redmine_issue_badge

echo "Issue Favicon"
git clone https://github.com/akiko-pusu/redmine_issue_favicon.git

echo "Redmine Issue Templates"
git clone https://github.com/akiko-pusu/redmine_issue_templates.git redmine_issue_templates

echo "Redmine LightBox"
git clone https://github.com/paginagmbh/redmine_lightbox2.git

echo "Spent Time"
git clone https://github.com/eyp/redmine_spent_time.git

echo "Integração 0800Net e Redmine"
git clone https://github.com/ebaptistella/integrator0800.git

echo "Best Timer"
git clone https://github.com/LeviticusMB/bestest_timer

echo "Redmine Login Audit"
git clone https://github.com/martin-denizet/redmine_login_audit.git

echo "Sidebar Hide"
git clone https://github.com/bdemirkir/sidebar_hide.git

echo "Niko-Niko"
git clone https://github.com/yuuu/redmine_nikoca_re.git

echo "Redmine Tags"
git clone https://github.com/ixti/redmine_tags.git

echo "Redmine Avatar"
git clone https://github.com/ncoders/redmine_local_avatars.git

echo "Redmine Checklists"
git clone https://github.com/Restream/redmine_issue_checklist.git

echo "Redmine Banner"
git clone https://github.com/akiko-pusu/redmine_banner.git

echo "Redmine Percent Done"
git clone https://github.com/jkraemer/redmine_percent_done.git

echo "Finalizado a instalação de plugins"

cd ..
echo "---INICIANDO bundle install test---"

echo "Adicionando arquivo de configuração"
cd config
wget https://raw.githubusercontent.com/adrianobr/redmine_upgrade/master/config/configuration.yml
cd ..

bundle install --without development test

echo "Executando migrations de todos os plugins"
bundle exec rake redmine:plugins:migrate RAILS_ENV=production

echo "Restartando..."
touch tmp/restart.txt
