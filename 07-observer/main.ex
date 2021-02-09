subject = Observable.create()

IO.puts(Observable.read(subject))

Observable.attach(subject)

Observable.increment(subject)
IO.puts(Observable.await())

Observable.increment(subject)
IO.puts(Observable.await())

Observable.decrement(subject)
IO.puts(Observable.await())

Observable.increment(subject)
IO.puts(Observable.await())

Observable.detach(subject)
Observable.increment(subject)
IO.puts(Observable.await())
#
#IO.puts("------------------------")
#subject = FObs.create()
#
#IO.puts(FObs.read(subject))
#
#FObs.attach(subject)
#
#FObs.increment(subject)
#IO.puts(FObs.await())
#
#FObs.increment(subject)
#IO.puts(FObs.await())
#
#FObs.decrement(subject)
#IO.puts(FObs.await())
#
#FObs.detach(subject)
#FObs.increment(subject)
#IO.puts(FObs.await())
#
