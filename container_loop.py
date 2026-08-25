import subprocess

from nena_component_tools.task_iterator import create_task_iterator


def main():
    task_iterator = create_task_iterator(upper_bound_run_time__seconds=60)
    for task in task_iterator:
        a = task.input_dictionary['a']
        b = task.input_dictionary['b']
        process_result = subprocess.run(['build/pipeline_executable', str(a), str(b)],
                                        capture_output=True, text=True)
        output_dictionary = {'c': float(process_result.stdout)}
        task.emit_event(event_source='minimal_fortran_component_pipeline', output_dictionary=output_dictionary)


if __name__ == '__main__':
    main()
