document.addEventListener("DOMContentLoaded", () => {
    let currentQuestionIndex = 0;
    let score = 0;
    let inProgress = false;

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

    const questionContainer = document.querySelector('.question-container');
    const questions = document.querySelectorAll('.question-container .question');
    const optionsContainers = document.querySelectorAll('.question-container .options');
    const scoreContainer = document.querySelector('.score-container');
    const scoreElement = document.querySelector('.score');
    const retryButton = document.querySelector('#retry-button');

    function showQuestion(index) {
        questions.forEach((question, i) => {
            question.style.display = i === index ? 'block' : 'none';
            optionsContainers[i].style.display = i === index ? 'flex' : 'none';
        });
    }

    function showScore() {
        questionContainer.style.display = 'none';
        scoreContainer.style.display = 'flex';
        scoreElement.innerHTML = `你的得分是：${score} / ${questions.length}`;
        document.querySelector('.image').src = "images/pic1.jpeg";
        retryButton.style.display = 'block';  // 显示重新答题按钮
        inProgress = false;  // Reset progress to allow fetching new questions
    }

    function initializeQuestions() {
        optionsContainers.forEach((optionsContainer, questionIndex) => {
            const questionData = optionsContainer.dataset;
            const options = optionsContainer.querySelectorAll('.option');

            options.forEach((option, i) => {
                option.addEventListener('click', () => {
                    if (i === parseInt(questionData.answer)) {
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
            });
        });

        showQuestion(currentQuestionIndex);
    }

    document.body.addEventListener('keydown', function (event) {
        if (event.code === 'Space' && !inProgress) {
            console.log("Space key pressed");
            document.querySelector('.intro').style.display = 'none';
            questionContainer.style.display = 'flex';
            scoreContainer.style.display = 'none';
            retryButton.style.display = 'none';  // 隐藏重新答题按钮
            inProgress = true;
            initializeQuestions();
        }
    });

    retryButton.addEventListener('click', function() {
        location.reload();
    });
});
