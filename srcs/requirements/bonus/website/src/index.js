const array = [
  {
    name: "Cub3d",
    html_url: "https://github.com/Hicham-BelHoucin/Cub3d",
  },
  {
    name: "ft_containers",
    html_url: "https://github.com/Hicham-BelHoucin/ft_containers",
  },
  {
    name: "Hicham-BelHoucin",
    html_url: "https://github.com/Hicham-BelHoucin/Hicham-BelHoucin",
  },
  {
    name: "inception",
    html_url: "https://github.com/Hicham-BelHoucin/inception",
  },
  {
    name: "Push_Swap_Tester",
    html_url: "https://github.com/Hicham-BelHoucin/Push_Swap_Tester",
  },
  {
    name: "React-Tailwind-CSS-Image-Gallery",
    html_url:
      "https://github.com/Hicham-BelHoucin/React-Tailwind-CSS-Image-Gallery",
  },
  {
    name: "SimpleProjectWithReact",
    html_url: "https://github.com/Hicham-BelHoucin/SimpleProjectWithReact",
  },
  {
    name: "Typing-Speed-Test-",
    html_url: "https://github.com/Hicham-BelHoucin/Typing-Speed-Test-",
  },
  {
    name: "websrv",
    html_url: "https://github.com/Hicham-BelHoucin/websrv",
  },
];

function CreateCard(item) {
  const container = document.createElement("div");
  container.setAttribute("class", "card");
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
	`;
  const parent = document.getElementById("content");
  parent.appendChild(container);
}

array.map((item) => {
  CreateCard(item);
});

// added by me

const languagePercentages = [
  { language: "C", percentage: 80 },
  { language: "Makefile", percentage: 50 },
  { language: "C++", percentage: 80 },
  { language: "CSS", percentage: 50 },
  { language: "Dockerfile", percentage: 50 },
  { language: "HTML", percentage: 60 },
  { language: "Shell", percentage: 50 },
  { language: "JavaScript", percentage: 60 },
  { language: "TypeScript", percentage: 40 },
  { language: "React", percentage: 40 },
  { language: "Nodejs", percentage: 40 },
  { language: "Python", percentage: 20 },
];

const getlanguages = () => {
  languagePercentages.map((item) => {
    const parent = document.getElementById("root");
    const container = document.createElement("div");
    container.innerHTML = `
		<div class="skillBar">
			<h4>${item.language}</h4>
			<div class="skillBarContainer">
			<div class="skillBarValue value-${item.percentage}"></div>
			</div>
		</div>
		`;
    parent.appendChild(container);
  });
};

getlanguages();
