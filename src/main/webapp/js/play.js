document.addEventListener("DOMContentLoaded", () => {
    let currentQuestionIndex = 0;
    let score = 0;

    const blocks = document.querySelectorAll('.red-block');
    const order = [0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 23, 22, 21, 20, 19, 18, 17, 16, 15, 13, 11, 9];
    let currentIndex = 0;

    function moveImage() {
        const currentBlock = blocks[order[currentIndex]];
        const nextIndex = (currentIndex + 1) % order.length;
        const nextBlock = blocks[order[nextIndex]];

        const img = currentBlock.querySelector('.image');

        if (img) {
            img.classList.remove('active');
            nextBlock.appendChild(img);
            setTimeout(() => {
                img.classList.add('active');
            }, 100);
        }

        currentIndex = nextIndex;
    }

    setInterval(moveImage, 2000);

    function showQuestion(index) {
        if (!questions || questions.length === 0) {
            console.error("Questions array is empty or not defined");
            return;
        }

        if (!questions[index]) {
            console.error("Question at index " + index + " is null or undefined");
            return;
        }

        const questionContainer = document.querySelector('.question-container');
        const questionElement = document.querySelector('.question');
        const optionsElement = document.querySelector('.options');

        const questionData = questions[index];

        questionElement.innerText = questionData.question;
        optionsElement.innerHTML = '';

        questionData.options.forEach((option, i) => {
            const optionElement = document.createElement('div');
            optionElement.className = 'option';
            optionElement.innerText = option;
            optionElement.addEventListener('click', () => {
                if (i === questionData.answer) {
                    score++;
                    document.querySelector('.image').src = "images/pic1.jpeg";
                } else {
                    document.querySelector('.image').src = "images/pic2.jpeg";
                }
                currentQuestionIndex++;
                if (currentQuestionIndex < questions.length) {
                    showQuestion(currentQuestionIndex);
                } else {
                    showScore();
                }
            });
            optionsElement.appendChild(optionElement);
        });

        questionContainer.style.display = 'flex';
    }

    function showScore() {
        const questionContainer = document.querySelector('.question-container');
        questionContainer.style.display = 'none';

        const contentElement = document.querySelector('.content');
        contentElement.innerHTML = `<h1>你的得分是：${score} / ${questions.length}</h1>`;
        document.querySelector('.image').src = "images/pic1.jpeg";
    }

    document.body.addEventListener('keydown', function (event) {
        if (event.code === 'Space') {
            console.log("Space key pressed");
            console.log("Questions:", questions);
            document.querySelector('.intro').style.display = 'none';
            showQuestion(currentQuestionIndex);
        }
    });
});
