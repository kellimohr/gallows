defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view

  @responses %{
    :won          => { :success, "We have a winner!" },
    :lost         => { :danger, "YOU LOSE!" },
    :good_guess   => { :success, "Correct!" },
    :bad_guess    => { :warning, "Wrong. So Wrong." },
    :already_used => { :info, "Hello McFly. You guessed that already!"}
  }

  def game_state(state) do
    @responses[state]
    |> alert()
  end
   
  defp alert(nil), do: ""
  defp alert( {class, message} ) do
    """
    <div class="alert alert-#{class}">
      #{message} 
    </div>
    """
    |> raw()
  end
end
