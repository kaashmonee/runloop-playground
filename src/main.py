if __name__ == "__main__":
    import openai
    import os
    from runloop_api_client import Runloop

    openai.api_key = os.environ.get("OPENAI_API_KEY")


    response = openai.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": "You are a helpful Python code generating assistant. You output code only, no other text. Do NOT wrap your code in ```python or ```bash or anything like that."},
            {"role": "user", "content": "Write a Python script that generates an ASCII art maze and prints it to stdout. It should be 10x10 in size and callable from the command line via `python maze.py`."}
        ]
    )

    python_script = response.choices[0].message.content
    print(python_script)

    runloop_client = Runloop(bearer_token=os.environ.get("RUNLOOP_API_KEY"))
    print("spinning up devbox and running code")
    devbox = runloop_client.devboxes.create_and_await_running()
    print(devbox.id)
