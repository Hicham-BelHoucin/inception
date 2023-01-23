const array = [
	{
	  name: '1337-contributors',
	  html_url: 'https://github.com/Hicham-BelHoucin/1337-contributors'
	},
	{
	  name: 'Cub3d',
	  html_url: 'https://github.com/Hicham-BelHoucin/Cub3d'
	},
	{
	  name: 'ft_containers',
	  html_url: 'https://github.com/Hicham-BelHoucin/ft_containers'
	},
	{
	  name: 'ft_transcendence',
	  html_url: 'https://github.com/Hicham-BelHoucin/ft_transcendence'
	},
	{
	  name: 'Hicham-BelHoucin',
	  html_url: 'https://github.com/Hicham-BelHoucin/Hicham-BelHoucin'
	},
	{
	  name: 'highlight-words',
	  html_url: 'https://github.com/Hicham-BelHoucin/highlight-words'
	},
	{
	  name: 'inception',
	  html_url: 'https://github.com/Hicham-BelHoucin/inception'
	},
	{
	  name: 'labs-cluster',
	  html_url: 'https://github.com/Hicham-BelHoucin/labs-cluster'
	},
	{
	  name: 'Push_Swap_Tester',
	  html_url: 'https://github.com/Hicham-BelHoucin/Push_Swap_Tester'
	},
	{
	  name: 'React-Tailwind-CSS-Image-Gallery',
	  html_url: 'https://github.com/Hicham-BelHoucin/React-Tailwind-CSS-Image-Gallery'
	},
	{
	  name: 'SimpleProjectWithReact',
	  html_url: 'https://github.com/Hicham-BelHoucin/SimpleProjectWithReact'
	},
	{
	  name: 'Typing-Speed-Test-',
	  html_url: 'https://github.com/Hicham-BelHoucin/Typing-Speed-Test-'
	},
	{
	  name: 'websrv',
	  html_url: 'https://github.com/Hicham-BelHoucin/websrv'
	},
]

function CreateCard(item) {
	const container = document.createElement('div');
	container.setAttribute('class', 'card');
	container.innerHTML = `
		<div class="icon1">
			<i class="fa-solid fa-file-code"></i>
		</div>
		<div class="informations">
			<h3 class="name_project">${item.name}</h3>
			<br>
			<div class="link_git">
				<a href="${item.html_url}"  target="_blank" class="sources">source code</a>
			</div>
		</div>
	`
	const parent = document.getElementById('content');
	parent.appendChild(container);
}

array.map((item) => {
	CreateCard(item);
})