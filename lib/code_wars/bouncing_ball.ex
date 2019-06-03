defmodule Bouncingball do
  @doc """
  Calculate the amount of times a ball bouncing on floor will pass
  through a window

  ## Examples

      iex> Bouncingball.bouncing_ball(3, 0.66, 1.5)
      3
      iex> Bouncingball.bouncing_ball(30, 0.66, 1.5)
      15
      iex> Bouncingball.bouncing_ball(3, 1, 1.5)
      -1

  """
  @spec bouncing_ball(number, number, number) :: integer
  def bouncing_ball(h, bounce, window)
      when h > 0 and
             bounce > 0 and bounce < 1 and
             window < h do
    do_bounce(h, bounce, window, 0)
  end

  def bouncing_ball(_, _, _) do
    +(-1)
  end

  defp do_bounce(h, bounce, window, seen) when h > window do
    # seen on downfall
    seen = seen + 1
    bounced = h * bounce

    if bounced <= window do
      seen
    else
      do_bounce(bounced, bounce, window, seen + 1)
    end
  end

  defp do_bounce(_h, _bounce, _window, seen) do
    seen
  end
end
