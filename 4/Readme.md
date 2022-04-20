# Q-Learning - Reinforcement Learning

Implement Forward algorithm to compute the sum of the scores of all possible hidden state sequences.
Compute all of the relevant α values. Also show the most probable path.

Implement Viterbi algorithm to compute the score of the best hidden state Sequence and the most probable path.

**Reinforcement Learning**:

Consider the following reinforcement learning problem.

There are 12 states, and the actions are {up, down, left, right}. Legal actions are those that go to the immediate neighbor, horizontally or vertically (but not diagonally). State S7 is the goal state, and the only action here is to itself with reward 0. Treat State 7 (s7) as having no legal action.

- The rewards for all action are 0, except for all actions that lead into s7, which are 100.

Program a Q-learning algorithm to learn the Q(s, a) values for the above example. Stop learning when change in the Q table is 0 for the past 50 Q updates or so. Note: use a random policy to select action a given current states (take care to check if the random action chosen is a legal one).

1.Show resulting Q table (12 × 4 matrix).

- Rows represent state and columns represent action.

Column ordering should be up, down, left, right, from left to right.

- Set Q(s, a) = -99 to mark illegal moves. Don’t use this value during your calculations.
